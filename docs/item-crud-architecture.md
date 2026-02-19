# Item CRUD Architecture

> Unified CRUD system design for all 7 item types in DevStash

---

## Overview

This document defines the architecture for creating, reading, updating, and deleting items across all 7 item types (snippet, prompt, command, note, file, image, link). The design uses:

- **Server Actions** for mutations (create, update, delete)
- **Direct Prisma queries** in `lib/db/` for data fetching
- **Dynamic routing** via `/items/[type]`
- **Shared components** that adapt based on item type

---

## File Structure

```
src/
├── actions/
│   └── items.ts              # All item mutations (create, update, delete, toggle)
│
├── lib/
│   └── db/
│       ├── items.ts          # Item queries (existing + new)
│       └── collections.ts    # Collection queries (existing)
│
├── app/
│   └── (dashboard)/
│       └── items/
│           └── [type]/
│               ├── page.tsx      # Server component - item list page
│               └── loading.tsx   # Loading skeleton
│
├── components/
│   └── items/
│       ├── item-list.tsx         # Grid/list of items (server)
│       ├── item-card.tsx         # Individual item card (server)
│       ├── item-drawer.tsx       # View/edit drawer (client)
│       ├── item-form.tsx         # Create/edit form (client)
│       ├── item-actions.tsx      # Delete, favorite, pin buttons (client)
│       ├── item-content.tsx      # Type-specific content display
│       ├── content-editor.tsx    # Text/markdown editor (client)
│       ├── file-uploader.tsx     # File upload component (client)
│       └── link-input.tsx        # URL input with preview (client)
│
└── types/
    └── items.ts              # Shared item types and interfaces
```

---

## Dynamic Routing: `/items/[type]`

### Route Pattern

```
/items/snippets   → type = "snippet"
/items/prompts    → type = "prompt"
/items/commands   → type = "command"
/items/notes      → type = "note"
/items/files      → type = "file"
/items/images     → type = "image"
/items/links      → type = "link"
```

### URL to Type Mapping

```typescript
// src/lib/constants/item-types.ts

export const ROUTE_TO_TYPE: Record<string, string> = {
  snippets: 'snippet',
  prompts: 'prompt',
  commands: 'command',
  notes: 'note',
  files: 'file',
  images: 'image',
  links: 'link',
};

export const TYPE_TO_ROUTE: Record<string, string> = {
  snippet: 'snippets',
  prompt: 'prompts',
  command: 'commands',
  note: 'notes',
  file: 'files',
  image: 'images',
  link: 'links',
};

export const VALID_ROUTES = Object.keys(ROUTE_TO_TYPE);
```

### Page Component

```typescript
// src/app/(dashboard)/items/[type]/page.tsx

import { auth } from '@/auth';
import { redirect, notFound } from 'next/navigation';
import { getItemsByType, getItemTypeByName } from '@/lib/db/items';
import { ROUTE_TO_TYPE, VALID_ROUTES } from '@/lib/constants/item-types';
import ItemList from '@/components/items/item-list';
import DashboardLayout from '@/components/layout/dashboard-layout';

interface Props {
  params: Promise<{ type: string }>;
  searchParams: Promise<{ q?: string; sort?: string }>;
}

export default async function ItemTypePage({ params, searchParams }: Props) {
  const session = await auth();
  if (!session?.user?.id) {
    redirect('/sign-in');
  }

  const { type: routeType } = await params;
  const { q: query, sort } = await searchParams;

  // Validate route
  if (!VALID_ROUTES.includes(routeType)) {
    notFound();
  }

  const typeName = ROUTE_TO_TYPE[routeType];

  // Fetch data in parallel
  const [items, itemType] = await Promise.all([
    getItemsByType(session.user.id, typeName, { query, sort }),
    getItemTypeByName(typeName),
  ]);

  if (!itemType) {
    notFound();
  }

  return (
    <DashboardLayout>
      <ItemList
        items={items}
        itemType={itemType}
        query={query}
        sort={sort}
      />
    </DashboardLayout>
  );
}
```

---

## Server Actions: `src/actions/items.ts`

All mutations live in one file with consistent patterns:

```typescript
// src/actions/items.ts

'use server';

import { auth } from '@/auth';
import { revalidatePath } from 'next/cache';
import { prisma } from '@/lib/prisma';
import { z } from 'zod';
import { ContentType } from '@/generated/prisma/client';

// ============================================
// SCHEMAS
// ============================================

const createTextItemSchema = z.object({
  title: z.string().min(1).max(255),
  content: z.string().min(1),
  description: z.string().max(1000).optional(),
  language: z.string().max(50).optional(),
  itemTypeName: z.enum(['snippet', 'prompt', 'command', 'note']),
  collectionIds: z.array(z.string()).optional(),
  tags: z.array(z.string().max(50)).max(10).optional(),
});

const createLinkItemSchema = z.object({
  title: z.string().min(1).max(255),
  url: z.string().url(),
  description: z.string().max(1000).optional(),
  collectionIds: z.array(z.string()).optional(),
  tags: z.array(z.string().max(50)).max(10).optional(),
});

const createFileItemSchema = z.object({
  title: z.string().min(1).max(255),
  fileUrl: z.string().url(),
  fileName: z.string().min(1),
  fileSize: z.number().positive(),
  description: z.string().max(1000).optional(),
  itemTypeName: z.enum(['file', 'image']),
  collectionIds: z.array(z.string()).optional(),
  tags: z.array(z.string().max(50)).max(10).optional(),
});

const updateItemSchema = z.object({
  id: z.string(),
  title: z.string().min(1).max(255).optional(),
  content: z.string().optional(),
  url: z.string().url().optional(),
  description: z.string().max(1000).optional(),
  language: z.string().max(50).optional(),
  collectionIds: z.array(z.string()).optional(),
  tags: z.array(z.string().max(50)).max(10).optional(),
});

// ============================================
// RESPONSE TYPE
// ============================================

type ActionResult<T = void> =
  | { success: true; data?: T }
  | { success: false; error: string };

// ============================================
// CREATE ACTIONS
// ============================================

export async function createTextItem(
  input: z.infer<typeof createTextItemSchema>
): Promise<ActionResult<{ id: string }>> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    const validated = createTextItemSchema.parse(input);

    // Get item type
    const itemType = await prisma.itemType.findFirst({
      where: { name: validated.itemTypeName, isSystem: true },
    });

    if (!itemType) {
      return { success: false, error: 'Invalid item type' };
    }

    // Create item with tags and collections
    const item = await prisma.item.create({
      data: {
        title: validated.title,
        contentType: ContentType.TEXT,
        content: validated.content,
        description: validated.description,
        language: validated.language,
        userId: session.user.id,
        itemTypeId: itemType.id,
        tags: validated.tags?.length ? {
          connectOrCreate: validated.tags.map(name => ({
            where: { name },
            create: { name },
          })),
        } : undefined,
        collections: validated.collectionIds?.length ? {
          create: validated.collectionIds.map(collectionId => ({
            collectionId,
          })),
        } : undefined,
      },
    });

    revalidatePath('/dashboard');
    revalidatePath(`/items/${validated.itemTypeName}s`);

    return { success: true, data: { id: item.id } };
  } catch (error) {
    if (error instanceof z.ZodError) {
      return { success: false, error: error.errors[0].message };
    }
    console.error('Create item error:', error);
    return { success: false, error: 'Failed to create item' };
  }
}

export async function createLinkItem(
  input: z.infer<typeof createLinkItemSchema>
): Promise<ActionResult<{ id: string }>> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    const validated = createLinkItemSchema.parse(input);

    const itemType = await prisma.itemType.findFirst({
      where: { name: 'link', isSystem: true },
    });

    if (!itemType) {
      return { success: false, error: 'Invalid item type' };
    }

    const item = await prisma.item.create({
      data: {
        title: validated.title,
        contentType: ContentType.URL,
        url: validated.url,
        description: validated.description,
        userId: session.user.id,
        itemTypeId: itemType.id,
        tags: validated.tags?.length ? {
          connectOrCreate: validated.tags.map(name => ({
            where: { name },
            create: { name },
          })),
        } : undefined,
        collections: validated.collectionIds?.length ? {
          create: validated.collectionIds.map(collectionId => ({
            collectionId,
          })),
        } : undefined,
      },
    });

    revalidatePath('/dashboard');
    revalidatePath('/items/links');

    return { success: true, data: { id: item.id } };
  } catch (error) {
    if (error instanceof z.ZodError) {
      return { success: false, error: error.errors[0].message };
    }
    console.error('Create link error:', error);
    return { success: false, error: 'Failed to create link' };
  }
}

export async function createFileItem(
  input: z.infer<typeof createFileItemSchema>
): Promise<ActionResult<{ id: string }>> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    // Pro check for file/image types
    const user = await prisma.user.findUnique({
      where: { id: session.user.id },
      select: { isPro: true },
    });

    if (!user?.isPro) {
      return { success: false, error: 'File uploads require a Pro subscription' };
    }

    const validated = createFileItemSchema.parse(input);

    const itemType = await prisma.itemType.findFirst({
      where: { name: validated.itemTypeName, isSystem: true },
    });

    if (!itemType) {
      return { success: false, error: 'Invalid item type' };
    }

    const item = await prisma.item.create({
      data: {
        title: validated.title,
        contentType: ContentType.FILE,
        fileUrl: validated.fileUrl,
        fileName: validated.fileName,
        fileSize: validated.fileSize,
        description: validated.description,
        userId: session.user.id,
        itemTypeId: itemType.id,
        tags: validated.tags?.length ? {
          connectOrCreate: validated.tags.map(name => ({
            where: { name },
            create: { name },
          })),
        } : undefined,
        collections: validated.collectionIds?.length ? {
          create: validated.collectionIds.map(collectionId => ({
            collectionId,
          })),
        } : undefined,
      },
    });

    revalidatePath('/dashboard');
    revalidatePath(`/items/${validated.itemTypeName}s`);

    return { success: true, data: { id: item.id } };
  } catch (error) {
    if (error instanceof z.ZodError) {
      return { success: false, error: error.errors[0].message };
    }
    console.error('Create file error:', error);
    return { success: false, error: 'Failed to upload file' };
  }
}

// ============================================
// UPDATE ACTION
// ============================================

export async function updateItem(
  input: z.infer<typeof updateItemSchema>
): Promise<ActionResult> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    const validated = updateItemSchema.parse(input);

    // Verify ownership
    const existing = await prisma.item.findFirst({
      where: { id: validated.id, userId: session.user.id },
      include: { itemType: true },
    });

    if (!existing) {
      return { success: false, error: 'Item not found' };
    }

    // Update item
    await prisma.item.update({
      where: { id: validated.id },
      data: {
        title: validated.title,
        content: validated.content,
        url: validated.url,
        description: validated.description,
        language: validated.language,
        // Handle tags update
        tags: validated.tags !== undefined ? {
          set: [], // Clear existing
          connectOrCreate: validated.tags.map(name => ({
            where: { name },
            create: { name },
          })),
        } : undefined,
        // Handle collections update
        collections: validated.collectionIds !== undefined ? {
          deleteMany: {},
          create: validated.collectionIds.map(collectionId => ({
            collectionId,
          })),
        } : undefined,
      },
    });

    revalidatePath('/dashboard');
    revalidatePath(`/items/${existing.itemType.name}s`);

    return { success: true };
  } catch (error) {
    if (error instanceof z.ZodError) {
      return { success: false, error: error.errors[0].message };
    }
    console.error('Update item error:', error);
    return { success: false, error: 'Failed to update item' };
  }
}

// ============================================
// DELETE ACTION
// ============================================

export async function deleteItem(id: string): Promise<ActionResult> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    // Verify ownership and get type for revalidation
    const item = await prisma.item.findFirst({
      where: { id, userId: session.user.id },
      include: { itemType: true },
    });

    if (!item) {
      return { success: false, error: 'Item not found' };
    }

    await prisma.item.delete({ where: { id } });

    revalidatePath('/dashboard');
    revalidatePath(`/items/${item.itemType.name}s`);

    return { success: true };
  } catch (error) {
    console.error('Delete item error:', error);
    return { success: false, error: 'Failed to delete item' };
  }
}

// ============================================
// TOGGLE ACTIONS
// ============================================

export async function toggleItemFavorite(id: string): Promise<ActionResult> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    const item = await prisma.item.findFirst({
      where: { id, userId: session.user.id },
    });

    if (!item) {
      return { success: false, error: 'Item not found' };
    }

    await prisma.item.update({
      where: { id },
      data: { isFavorite: !item.isFavorite },
    });

    revalidatePath('/dashboard');

    return { success: true };
  } catch (error) {
    console.error('Toggle favorite error:', error);
    return { success: false, error: 'Failed to update favorite status' };
  }
}

export async function toggleItemPinned(id: string): Promise<ActionResult> {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return { success: false, error: 'Unauthorized' };
    }

    const item = await prisma.item.findFirst({
      where: { id, userId: session.user.id },
    });

    if (!item) {
      return { success: false, error: 'Item not found' };
    }

    await prisma.item.update({
      where: { id },
      data: { isPinned: !item.isPinned },
    });

    revalidatePath('/dashboard');

    return { success: true };
  } catch (error) {
    console.error('Toggle pinned error:', error);
    return { success: false, error: 'Failed to update pinned status' };
  }
}
```

---

## Data Fetching: `src/lib/db/items.ts`

Add these functions to the existing items.ts file:

```typescript
// New functions to add to src/lib/db/items.ts

interface GetItemsOptions {
  query?: string;
  sort?: string;
  limit?: number;
}

export async function getItemsByType(
  userId: string,
  typeName: string,
  options: GetItemsOptions = {}
): Promise<ItemWithType[]> {
  const { query, sort = 'updatedAt', limit } = options;

  const itemType = await prisma.itemType.findFirst({
    where: { name: typeName, isSystem: true },
  });

  if (!itemType) return [];

  const items = await prisma.item.findMany({
    where: {
      userId,
      itemTypeId: itemType.id,
      ...(query ? {
        OR: [
          { title: { contains: query, mode: 'insensitive' } },
          { description: { contains: query, mode: 'insensitive' } },
          { content: { contains: query, mode: 'insensitive' } },
        ],
      } : {}),
    },
    include: {
      itemType: true,
      tags: { select: { name: true } },
    },
    orderBy: sort === 'title'
      ? { title: 'asc' }
      : sort === 'createdAt'
      ? { createdAt: 'desc' }
      : { updatedAt: 'desc' },
    ...(limit ? { take: validateLimit(limit) } : {}),
  });

  return items.map(item => ({
    id: item.id,
    title: item.title,
    description: item.description,
    content: item.content,
    url: item.url,
    fileUrl: item.fileUrl,
    fileName: item.fileName,
    fileSize: item.fileSize,
    language: item.language,
    isFavorite: item.isFavorite,
    isPinned: item.isPinned,
    itemType: item.itemType,
    tags: item.tags.map(t => t.name),
    createdAt: item.createdAt,
    updatedAt: item.updatedAt,
  }));
}

export async function getItemById(
  userId: string,
  itemId: string
): Promise<ItemWithType | null> {
  const item = await prisma.item.findFirst({
    where: { id: itemId, userId },
    include: {
      itemType: true,
      tags: { select: { name: true } },
      collections: {
        include: { collection: { select: { id: true, name: true } } },
      },
    },
  });

  if (!item) return null;

  return {
    id: item.id,
    title: item.title,
    description: item.description,
    content: item.content,
    url: item.url,
    fileUrl: item.fileUrl,
    fileName: item.fileName,
    fileSize: item.fileSize,
    language: item.language,
    isFavorite: item.isFavorite,
    isPinned: item.isPinned,
    itemType: item.itemType,
    tags: item.tags.map(t => t.name),
    collections: item.collections.map(ic => ic.collection),
    createdAt: item.createdAt,
    updatedAt: item.updatedAt,
  };
}

export async function getItemTypeByName(name: string) {
  return prisma.itemType.findFirst({
    where: { name, isSystem: true },
  });
}
```

---

## Component Responsibilities

### Server Components (No 'use client')

| Component | Responsibility |
|-----------|---------------|
| `ItemList` | Fetches nothing (receives data), renders header + grid of ItemCards |
| `ItemCard` | Displays item preview, icon, tags, status badges |
| `ItemContent` | Renders content based on type (code block, markdown, link preview, image) |

### Client Components ('use client')

| Component | Responsibility |
|-----------|---------------|
| `ItemDrawer` | Sheet/drawer for viewing and editing items, manages open state |
| `ItemForm` | Form fields for create/edit, calls server actions, manages form state |
| `ItemActions` | Favorite, pin, delete buttons, calls server actions with optimistic updates |
| `ContentEditor` | Code editor (Monaco/CodeMirror) or markdown editor based on type |
| `FileUploader` | Drag-drop file upload to R2, returns URL |
| `LinkInput` | URL input with optional metadata fetching |

---

## Type-Specific Logic Location

**Principle:** Type-specific behavior lives in components, NOT in actions.

### Actions (Type-Agnostic)
- Validate input
- Check auth/permissions
- Execute CRUD operation
- Revalidate paths

### Components (Type-Aware)
- Render appropriate editor (code vs markdown vs file upload vs URL input)
- Display content correctly (syntax highlighting, image preview, link card)
- Show relevant fields (language selector for snippets, URL validation for links)

### Example: ContentEditor

```typescript
// src/components/items/content-editor.tsx

'use client';

import { ContentType } from '@/generated/prisma/client';
import CodeEditor from './editors/code-editor';
import MarkdownEditor from './editors/markdown-editor';
import FileUploader from './file-uploader';
import LinkInput from './link-input';

interface ContentEditorProps {
  contentType: ContentType;
  itemTypeName: string;
  value: string;
  onChange: (value: string) => void;
  language?: string;
  onLanguageChange?: (lang: string) => void;
}

export default function ContentEditor({
  contentType,
  itemTypeName,
  value,
  onChange,
  language,
  onLanguageChange,
}: ContentEditorProps) {
  // Snippet: Code editor with language selector
  if (itemTypeName === 'snippet') {
    return (
      <CodeEditor
        value={value}
        onChange={onChange}
        language={language}
        onLanguageChange={onLanguageChange}
      />
    );
  }

  // Prompt, Command: Plain text or simple markdown
  if (itemTypeName === 'prompt' || itemTypeName === 'command') {
    return (
      <MarkdownEditor
        value={value}
        onChange={onChange}
        minimal
      />
    );
  }

  // Note: Full markdown editor
  if (itemTypeName === 'note') {
    return (
      <MarkdownEditor
        value={value}
        onChange={onChange}
      />
    );
  }

  // File, Image: File uploader
  if (contentType === 'FILE') {
    return (
      <FileUploader
        value={value}
        onChange={onChange}
        accept={itemTypeName === 'image' ? 'image/*' : undefined}
      />
    );
  }

  // Link: URL input
  if (contentType === 'URL') {
    return (
      <LinkInput
        value={value}
        onChange={onChange}
      />
    );
  }

  return null;
}
```

---

## Route Validation & 404 Handling

```typescript
// Middleware for route validation (optional, can also handle in page)

// src/app/(dashboard)/items/[type]/not-found.tsx
export default function NotFound() {
  return (
    <div className="flex flex-col items-center justify-center min-h-[400px]">
      <h2 className="text-2xl font-semibold mb-2">Invalid Item Type</h2>
      <p className="text-muted-foreground">
        The item type you're looking for doesn't exist.
      </p>
    </div>
  );
}
```

---

## Search & Filtering (URL State)

Search and sort use URL query parameters for shareability:

```
/items/snippets?q=react&sort=title
/items/prompts?q=code+review
```

### ItemListHeader Component

```typescript
// src/components/items/item-list-header.tsx

'use client';

import { useRouter, useSearchParams, usePathname } from 'next/navigation';
import { Input } from '@/components/ui/input';
import { Select } from '@/components/ui/select';
import { useDebouncedCallback } from 'use-debounce';

export default function ItemListHeader({ itemType, query, sort }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const updateParams = (key: string, value: string) => {
    const params = new URLSearchParams(searchParams);
    if (value) {
      params.set(key, value);
    } else {
      params.delete(key);
    }
    router.push(`${pathname}?${params.toString()}`);
  };

  const debouncedSearch = useDebouncedCallback((value: string) => {
    updateParams('q', value);
  }, 300);

  return (
    <div className="flex items-center justify-between mb-6">
      <h1 className="text-2xl font-bold">{itemType.name}s</h1>
      <div className="flex gap-4">
        <Input
          placeholder="Search..."
          defaultValue={query}
          onChange={(e) => debouncedSearch(e.target.value)}
        />
        <Select
          value={sort || 'updatedAt'}
          onValueChange={(value) => updateParams('sort', value)}
        >
          {/* Sort options */}
        </Select>
      </div>
    </div>
  );
}
```

---

## Summary

| Concern | Location | Pattern |
|---------|----------|---------|
| Mutations | `src/actions/items.ts` | Server Actions with Zod validation |
| Queries | `src/lib/db/items.ts` | Direct Prisma, called from server components |
| Routing | `/items/[type]/page.tsx` | Dynamic route with validation |
| Type logic | Components | Conditional rendering based on type |
| Forms | Client components | React state + server action calls |
| Search | URL params | Server-side filtering |

---

## Sources

- [context/project-overview.md](../context/project-overview.md) - Feature specifications
- [docs/item-types.md](item-types.md) - Item type reference
- [prisma/schema.prisma](../prisma/schema.prisma) - Database models
- Existing codebase patterns in `src/lib/db/`, `src/components/`

---

*Last updated: February 2026*
