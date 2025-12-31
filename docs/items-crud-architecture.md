# Items CRUD Architecture

## Overview

Architecture for implementing CRUD on item types, starting with Snippets. Designed to extend cleanly to other types (Prompt, Note, Command, Link, File, Image).

## Key Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| **Routes** | `/dashboard/snippets` | Clean URLs, matches sidebar pattern, type-specific pages if needed |
| **Server Actions** | Single `items.ts` | Avoids duplication, items share same DB model |
| **Components** | Shared base + type-specific fields | Common UI with conditional field sections |
| **Forms** | Composable `ItemForm` | Common fields shared, type-specific fields isolated |
| **Validation** | Zod discriminated unions | Type-safe per-type validation |
| **View/Edit** | Separate modes with toggle | View page shows content, "Edit" button switches to form |
| **Code Editor** | CodeMirror | Proper syntax highlighting from the start |
| **Delete** | Direct delete + undo toast | Quick action, recoverable via toast |
| **Item Detail** | Side panel/drawer | Click item → opens drawer on same page |

---

## File Structure

```
src/
├── actions/
│   └── items.ts                    # All item CRUD operations
├── lib/
│   ├── validations.ts              # Add item schemas
│   └── items.ts                    # NEW: Type helpers, language list
├── components/
│   ├── ui/
│   │   ├── sheet.tsx               # NEW: shadcn sheet (side panel)
│   │   └── sonner.tsx              # NEW: toast notifications
│   └── items/
│       ├── index.ts                # Barrel export
│       ├── ItemCard.tsx            # Display card (type-aware)
│       ├── ItemList.tsx            # Grid/list wrapper
│       ├── ItemHeader.tsx          # Page header + "New" button
│       ├── ItemSheet.tsx           # Side panel for view/edit
│       ├── ItemView.tsx            # Read-only item display
│       ├── CodeEditor.tsx          # CodeMirror wrapper
│       └── forms/
│           ├── ItemForm.tsx        # Main form wrapper
│           └── SnippetFields.tsx   # Code editor + language select
└── app/
    └── dashboard/
        ├── layout.tsx              # Add Toaster provider
        └── snippets/
            ├── page.tsx            # List + sheet (single page)
            └── new/
                └── page.tsx        # Create snippet (full page)
```

---

## Implementation Steps

### Step 1: Install Dependencies
```bash
npm install @codemirror/lang-javascript @codemirror/lang-python @codemirror/lang-html @codemirror/lang-css @codemirror/lang-json @codemirror/lang-markdown @uiw/react-codemirror sonner
npx shadcn@latest add sheet
```

### Step 2: Validation Schemas
**File**: `src/lib/validations.ts`

Add base item schema and snippet-specific schema:
- `baseItemSchema`: title, description, collectionId, tags, isFavorite, isPinned
- `snippetSchema`: extends base + content (required), language (optional)

### Step 3: Item Helpers
**File**: `src/lib/items.ts` (new)

- `getItemTypeByName(name)`: Get ItemType ID from name
- `SUPPORTED_LANGUAGES`: Array of language options for snippets

### Step 4: Server Actions
**File**: `src/actions/items.ts` (new)

Query functions:
- `getItemsByType(typeName, options?)`: List items filtered by type
- `getItemById(id)`: Single item with relations

Mutation functions:
- `createItem(formData)`: Create new item
- `updateItem(id, formData)`: Update existing
- `deleteItem(id)`: Delete item (returns undo data)

### Step 5: UI Components
**Folder**: `src/components/items/`

| Component | Purpose |
|-----------|---------|
| `ItemCard` | Display item in grid/list (type-aware colors, content preview) |
| `ItemList` | Wrapper with empty state |
| `ItemHeader` | Title, description, "New Snippet" button |
| `ItemSheet` | Side panel container (view/edit modes) |
| `ItemView` | Read-only display with syntax highlighting |
| `CodeEditor` | CodeMirror wrapper component |
| `ItemForm` | Common fields + type-specific section slot |
| `SnippetFields` | CodeMirror editor + language dropdown |

### Step 6: Toast Setup
**File**: `src/app/dashboard/layout.tsx`

Add `<Toaster />` from sonner for undo toasts

### Step 7: Route Pages
**Folder**: `src/app/dashboard/snippets/`

| Route | Purpose |
|-------|---------|
| `page.tsx` | List view + ItemSheet (client component for sheet state) |
| `new/page.tsx` | Full-page create form |

### Step 8: Update Sidebar
Update sidebar links from `/type/snippet` to `/dashboard/snippets`

---

## Server Action Signatures

```typescript
// Queries
export async function getItemsByType(
  typeName: string,
  options?: { limit?: number }
): Promise<ItemForList[]>

export async function getItemById(id: string): Promise<ItemWithType | null>

// Mutations
export async function createItem(formData: FormData): Promise<ActionResult>
export async function updateItem(id: string, formData: FormData): Promise<ActionResult>
export async function deleteItem(id: string): Promise<ActionResult>
```

---

## UX Flow

### List Page (`/dashboard/snippets`)
1. Shows grid of `ItemCard` components
2. Click card → opens `ItemSheet` (side panel) in **view mode**
3. View mode shows read-only content with syntax highlighting
4. "Edit" button → switches sheet to **edit mode** (shows form)
5. "Delete" button → deletes immediately, shows undo toast (5 seconds)

### Create Page (`/dashboard/snippets/new`)
1. Full-page form with CodeMirror editor
2. Submit → redirects to `/dashboard/snippets` with new item

### Sheet Modes
- **View**: `ItemView` component with code display, metadata, copy button
- **Edit**: `ItemForm` with `SnippetFields` (CodeMirror + language select)

---

## Extending to Other Types

Adding a new type (e.g., Prompt) requires:

1. Add validation schema to `validations.ts`
2. Create `PromptFields.tsx` component
3. Copy route folder structure to `dashboard/prompts/`
4. Update sidebar

The shared infrastructure (`ItemCard`, `ItemForm`, `items.ts` actions) handles everything else.

---

## Critical Files to Modify

| File | Change |
|------|--------|
| `src/lib/validations.ts` | Add item schemas |
| `src/lib/items.ts` | New file - type helpers |
| `src/actions/items.ts` | New file - all CRUD |
| `src/components/ui/sheet.tsx` | New - shadcn sheet |
| `src/components/items/*` | New folder - all components |
| `src/app/dashboard/layout.tsx` | Add Toaster |
| `src/app/dashboard/snippets/*` | New routes |
| `src/components/dashboard/Sidebar.tsx` | Update type links |
