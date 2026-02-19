# Item Types Documentation

> Generated documentation for DevStash's 7 item types

---

## Overview

DevStash uses 7 system-defined item types to categorize developer resources. Each type has a specific purpose, icon, color, and content storage method. All system types are immutable (`isSystem: true`) and shared across all users.

---

## Item Types Reference

### 1. Snippet

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `snippet`   |
| **Icon**    | `Code`      |
| **Color**   | `#3b82f6` (blue) |
| **Content** | TEXT        |
| **Route**   | `/items/snippets` |

**Purpose:** Store reusable code blocks, functions, patterns, and boilerplate code.

**Key Fields Used:**
- `content` - The code content (text)
- `language` - Programming language for syntax highlighting (e.g., "typescript", "python", "yaml")
- `description` - Explanation of what the code does

---

### 2. Prompt

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `prompt`    |
| **Icon**    | `Sparkles`  |
| **Color**   | `#8b5cf6` (purple) |
| **Content** | TEXT        |
| **Route**   | `/items/prompts` |

**Purpose:** Save AI prompts, system messages, and prompt templates with placeholders.

**Key Fields Used:**
- `content` - The prompt text, often with `{{placeholder}}` variables
- `description` - What the prompt is designed to accomplish

---

### 3. Command

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `command`   |
| **Icon**    | `Terminal`  |
| **Color**   | `#f97316` (orange) |
| **Content** | TEXT        |
| **Route**   | `/items/commands` |

**Purpose:** Store shell commands, scripts, and CLI one-liners for quick reference.

**Key Fields Used:**
- `content` - The command string
- `description` - What the command does and any important flags

---

### 4. Note

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `note`      |
| **Icon**    | `StickyNote` |
| **Color**   | `#fde047` (yellow) |
| **Content** | TEXT        |
| **Route**   | `/items/notes` |

**Purpose:** General-purpose notes, documentation, explanations, and reference material.

**Key Fields Used:**
- `content` - Markdown-formatted text content
- `description` - Brief summary

---

### 5. File (Pro Only)

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `file`      |
| **Icon**    | `File`      |
| **Color**   | `#6b7280` (gray) |
| **Content** | FILE        |
| **Route**   | `/items/files` |

**Purpose:** Upload and store documents, configuration files, and other file types.

**Key Fields Used:**
- `fileUrl` - Cloudflare R2 URL for the uploaded file
- `fileName` - Original filename
- `fileSize` - Size in bytes
- `description` - What the file contains

---

### 6. Image (Pro Only)

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `image`     |
| **Icon**    | `Image`     |
| **Color**   | `#ec4899` (pink) |
| **Content** | FILE        |
| **Route**   | `/items/images` |

**Purpose:** Store screenshots, diagrams, design assets, and visual references.

**Key Fields Used:**
- `fileUrl` - Cloudflare R2 URL for the image
- `fileName` - Original filename
- `fileSize` - Size in bytes
- `description` - What the image shows

---

### 7. Link

| Property    | Value       |
| ----------- | ----------- |
| **Name**    | `link`      |
| **Icon**    | `Link`      |
| **Color**   | `#10b981` (emerald) |
| **Content** | URL         |
| **Route**   | `/items/links` |

**Purpose:** Bookmark documentation, tools, articles, and external resources.

**Key Fields Used:**
- `url` - The external URL
- `description` - What the resource contains or why it's useful

---

## Content Type Classification

Items are classified by their `ContentType` enum:

| ContentType | Item Types          | Storage Method      |
| ----------- | ------------------- | ------------------- |
| `TEXT`      | snippet, prompt, command, note | `content` field (text blob) |
| `FILE`      | file, image         | `fileUrl` (Cloudflare R2) |
| `URL`       | link                | `url` field         |

---

## Shared Properties

All items share these common fields regardless of type:

| Field         | Type      | Description                              |
| ------------- | --------- | ---------------------------------------- |
| `id`          | String    | Unique identifier (cuid)                 |
| `title`       | String    | Display name for the item                |
| `contentType` | Enum      | TEXT, FILE, or URL                       |
| `description` | String?   | Optional description text                |
| `isFavorite`  | Boolean   | User-marked as favorite                  |
| `isPinned`    | Boolean   | Pinned to top of lists                   |
| `createdAt`   | DateTime  | When the item was created                |
| `updatedAt`   | DateTime  | Last modification time                   |
| `userId`      | String    | Owner of the item                        |
| `itemTypeId`  | String    | Reference to ItemType                    |
| `tags`        | Tag[]     | Many-to-many tag associations            |
| `collections` | ItemCollection[] | Many-to-many collection memberships |

---

## Display Differences

### Icon Rendering

Icons are mapped via `ITEM_TYPE_ICONS` in [src/lib/constants/item-types.ts](../src/lib/constants/item-types.ts):

```typescript
export const ITEM_TYPE_ICONS: Record<string, LucideIcon> = {
  Code,      // snippet
  Sparkles,  // prompt
  Terminal,  // command
  StickyNote,// note
  File,      // file
  Image,     // image
  Link: LinkIcon, // link
};
```

### Color Usage

Colors are applied as:
- Icon foreground color: `style={{ color: iconColor }}`
- Icon background tint: `style={{ backgroundColor: \`${iconColor}20\` }}` (20% opacity)
- Collection border indicators use the dominant item type's color

### Pro Feature Indicators

File and Image types display a "PRO" badge in the sidebar to indicate they require a paid subscription.

---

## Database Schema

### ItemType Model

```prisma
model ItemType {
  id       String  @id @default(cuid())
  name     String
  icon     String
  color    String
  isSystem Boolean @default(false)
  userId   String?
  user     User?   @relation(...)
  items    Item[]
  defaultForCollections Collection[]

  @@unique([name, userId])
  @@map("item_types")
}
```

### Item Model (Relevant Fields)

```prisma
model Item {
  id          String      @id @default(cuid())
  title       String
  contentType ContentType
  content     String?     @db.Text // TEXT types
  fileUrl     String?     // FILE types
  fileName    String?     // FILE types
  fileSize    Int?        // FILE types
  url         String?     // URL types
  description String?     @db.Text
  language    String?     // For syntax highlighting
  // ... other fields
}
```

---

## Sources

- [prisma/schema.prisma](../prisma/schema.prisma) - Database models
- [prisma/seed.ts](../prisma/seed.ts) - System type definitions
- [src/lib/constants/item-types.ts](../src/lib/constants/item-types.ts) - Icon/color mappings
- [context/project-overview.md](../context/project-overview.md) - Feature specifications

---

*Last updated: February 2026*
