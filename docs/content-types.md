# Content Types Reference

This document defines the seven system item types in DevStash, their properties, and display requirements.

---

## Type Classification

### Text-Based Types

Store content directly in the database using the `content` field.

- **Snippet** - Code with syntax highlighting
- **Prompt** - AI prompts and templates
- **Note** - Markdown-formatted notes
- **Command** - Terminal/shell commands

### File-Based Types

Store files in Cloudflare R2 using `fileUrl`, `fileName`, `fileSize`.

- **File** - Generic documents and files
- **Image** - Images with preview capability

### URL-Based Types

Store external links using the `url` field.

- **Link** - Web URLs and bookmarks

---

## System Item Types

### 1. Snippet

| Property      | Value            |
| ------------- | ---------------- |
| Name          | `snippet`        |
| Icon          | `Code`           |
| Color         | `#3b82f6` (Blue) |
| Display Order | 0                |
| Display Name  | Snippets         |

**Purpose**: Store reusable code snippets with syntax highlighting.

**Key Fields**:

- `contentType`: `"text"`
- `content`: The code content
- `language`: Programming language identifier (e.g., `typescript`, `python`, `yaml`)
- `description`: Optional explanation or usage notes

**Display Requirements**:

- Syntax highlighting based on `language` field
- Monospace font rendering
- Copy-to-clipboard functionality
- Line numbers (optional)
- Language badge/indicator

---

### 2. Prompt

| Property      | Value              |
| ------------- | ------------------ |
| Name          | `prompt`           |
| Icon          | `Sparkles`         |
| Color         | `#8b5cf6` (Purple) |
| Display Order | 1                  |
| Display Name  | Prompts            |

**Purpose**: Store AI prompts, system prompts, and prompt templates.

**Key Fields**:

- `contentType`: `"text"`
- `content`: The prompt text
- `description`: Optional context or usage instructions

**Display Requirements**:

- Plain text or markdown rendering
- Variable placeholders highlighting (e.g., `{{variable}}`)
- Copy-to-clipboard functionality
- Character/token count display (optional)

---

### 3. Command

| Property      | Value              |
| ------------- | ------------------ |
| Name          | `command`          |
| Icon          | `Terminal`         |
| Color         | `#f97316` (Orange) |
| Display Order | 2                  |
| Display Name  | Commands           |

**Purpose**: Store terminal commands, shell scripts, and CLI snippets.

**Key Fields**:

- `contentType`: `"text"`
- `content`: The command(s)
- `language`: Shell type (e.g., `bash`, `powershell`, `zsh`)
- `description`: What the command does

**Display Requirements**:

- Terminal-style monospace rendering
- OS/shell selector (macOS, Linux, Windows)
- Syntax highlighting for shell commands
- Copy-to-clipboard functionality
- Warning indicators for destructive commands (optional)

---

### 4. Note

| Property      | Value              |
| ------------- | ------------------ |
| Name          | `note`             |
| Icon          | `StickyNote`       |
| Color         | `#eab308` (Yellow) |
| Display Order | 3                  |
| Display Name  | Notes              |

**Purpose**: Store markdown-formatted notes, documentation, and text.

**Key Fields**:

- `contentType`: `"text"`
- `content`: Markdown content
- `description`: Optional summary

**Display Requirements**:

- Full markdown rendering (headings, lists, code blocks, links, etc.)
- WYSIWYG or split-pane editor
- Table of contents for long notes (optional)
- Export to .md functionality

---

### 5. File

| Property      | Value            |
| ------------- | ---------------- |
| Name          | `file`           |
| Icon          | `File`           |
| Color         | `#6b7280` (Gray) |
| Display Order | 4                |
| Display Name  | Files            |

**Purpose**: Store uploaded documents, templates, and generic files.

**Key Fields**:

- `contentType`: `"file"`
- `fileUrl`: R2 storage URL
- `fileName`: Original filename with extension
- `fileSize`: File size in bytes
- `description`: Optional file description

**Display Requirements**:

- File icon based on extension/MIME type
- Filename and size display
- Download button
- Preview for supported formats (PDF, text files)
- File type badge

---

### 6. Image

| Property      | Value            |
| ------------- | ---------------- |
| Name          | `image`          |
| Icon          | `Image`          |
| Color         | `#ec4899` (Pink) |
| Display Order | 5                |
| Display Name  | Images           |

**Purpose**: Store screenshots, diagrams, assets, and reference images.

**Key Fields**:

- `contentType`: `"file"`
- `fileUrl`: R2 storage URL
- `fileName`: Original filename
- `fileSize`: File size in bytes
- `description`: Alt text or description

**Display Requirements**:

- Thumbnail preview in list/grid view
- Full-size image viewer with zoom
- Download original functionality
- Dimensions display (optional)
- Lightbox for full-screen viewing

---

### 7. Link

| Property      | Value             |
| ------------- | ----------------- |
| Name          | `link`            |
| Icon          | `Link`            |
| Color         | `#10b981` (Green) |
| Display Order | 6                 |
| Display Name  | Links             |

**Purpose**: Store bookmarks, documentation links, and external resources.

**Key Fields**:

- `contentType`: `"text"` (no file upload needed)
- `url`: The external URL
- `description`: What the link is for

**Display Requirements**:

- Clickable URL that opens in new tab
- Favicon fetch (optional enhancement)
- URL domain display
- Open link button
- Link validation indicator (optional)

---

## Common Properties (All Types)

Every item shares these base fields regardless of type:

| Field          | Type      | Description                |
| -------------- | --------- | -------------------------- |
| `id`           | String    | Unique identifier (cuid)   |
| `title`        | String    | Item name/title (required) |
| `description`  | String?   | Optional description       |
| `isFavorite`   | Boolean   | Favorited status           |
| `isPinned`     | Boolean   | Pinned to top status       |
| `userId`       | String    | Owner reference            |
| `typeId`       | String    | ItemType reference         |
| `collectionId` | String?   | Optional collection        |
| `tags`         | ItemTag[] | Associated tags            |
| `createdAt`    | DateTime  | Creation timestamp         |
| `updatedAt`    | DateTime  | Last update timestamp      |

---

## Icon Mapping (Lucide React)

The frontend maps icon names to Lucide React components:

```typescript
const iconMap: Record<string, LucideIcon> = {
  Code, // snippet
  Sparkles, // prompt
  Terminal, // command
  StickyNote, // note
  File, // file
  Image, // image
  Link, // link
};
```

Fallback icon: `FileText`

---

## Color Reference

| Type    | Hex Code  | Tailwind Equivalent |
| ------- | --------- | ------------------- |
| Snippet | `#3b82f6` | blue-500            |
| Prompt  | `#8b5cf6` | violet-500          |
| Command | `#f97316` | orange-500          |
| Note    | `#eab308` | yellow-500          |
| File    | `#6b7280` | gray-500            |
| Image   | `#ec4899` | pink-500            |
| Link    | `#10b981` | emerald-500         |

---

## Database Schema Reference

### ItemType Model

```prisma
model ItemType {
  id       String  @id @default(cuid())
  name     String
  icon     String?
  color    String?
  isSystem Boolean @default(false)
  userId   String?
  user     User?   @relation(...)
  items    Item[]
}
```

### Item Model (Relevant Fields)

```prisma
model Item {
  id          String   @id @default(cuid())
  title       String
  contentType String   // "text" | "file"
  content     String?  // Text-based types
  fileUrl     String?  // File-based types
  fileName    String?  // File-based types
  fileSize    Int?     // File-based types
  url         String?  // URL-based types (link)
  description String?
  language    String?  // Code snippets, commands
  isFavorite  Boolean  @default(false)
  isPinned    Boolean  @default(false)
  typeId      String
  type        ItemType @relation(...)
  // ... other relations
}
```

---

## Field Usage Matrix

| Field       | Snippet | Prompt | Command | Note | File | Image | Link |
| ----------- | ------- | ------ | ------- | ---- | ---- | ----- | ---- |
| contentType | text    | text   | text    | text | file | file  | text |
| content     | Yes     | Yes    | Yes     | Yes  | -    | -     | -    |
| language    | Yes     | -      | Yes     | -    | -    | -     | -    |
| fileUrl     | -       | -      | -       | -    | Yes  | Yes   | -    |
| fileName    | -       | -      | -       | -    | Yes  | Yes   | -    |
| fileSize    | -       | -      | -       | -    | Yes  | Yes   | -    |
| url         | -       | -      | -       | -    | -    | -     | Yes  |
| description | Yes     | Yes    | Yes     | Yes  | Yes  | Yes   | Yes  |

---

## CRUD Considerations

### Create

- Validate `contentType` matches the selected type
- Text types require `content`, file types require file upload, link requires `url`
- `language` is optional but recommended for snippets and commands

### Read

- Filter by `typeId` for type-specific views
- Include type relation for icon/color rendering
- Support full-text search on `title`, `content`, `description`

### Update

- Cannot change `contentType` after creation (would break data integrity)
- File replacements should clean up old R2 objects
- URL changes should re-validate the link

### Delete

- Cascade delete tags (ItemTag)
- Clean up R2 files for file-based types
- Soft delete consideration for Pro users (future)

---

## Future Extensibility

### Custom Types (Pro Feature)

- `isSystem: false` with `userId` set
- Users can define custom icon, color, name
- Same field structure as system types

### Additional Fields to Consider

- `metadata`: JSON field for type-specific data
- `version`: For tracking content revisions
- `isPublic`: For shared/public items
