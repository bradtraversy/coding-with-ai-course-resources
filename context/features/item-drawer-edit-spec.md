# Item Drawer — Edit Mode

## Overview

Clicking the Edit button (pencil icon) in the item drawer's action bar switches from view mode to edit mode inline. The same drawer stays open — fields become editable inputs.

## Requirements

### Mode Toggle

- Edit button toggles the drawer into edit mode
- In edit mode, the action bar is replaced with Save and Cancel buttons
- Cancel discards changes and returns to view mode
- Save persists changes via server action, returns to view mode, and refreshes the drawer data
- Toast notification on save success or error

### Editable Fields

All types:

- **Title** — text input, required
- **Description** — textarea, optional
- **Tags** — comma-separated text input that converts to tag array on save

Type-specific (only show for the relevant item type):

| Field        | Shown for                      | Input type |
| ------------ | ------------------------------ | ---------- |
| **Content**  | snippet, prompt, command, note | textarea   |
| **Language** | snippet, command               | text input |
| **URL**      | link                           | text input |

### Non-Editable (display only in edit mode)

- Item type (snippet, prompt, etc.) — cannot be changed
- Collections — will be managed separately
- Created/Updated dates

## Validation

Zod schema for the update payload (per coding standards). Validate in the server action before hitting the database.

- `title` — non-empty string, trimmed
- `description` — string or null, optional
- `content` — string or null, optional
- `url` — valid URL string or null, optional
- `language` — string or null, optional
- `tags` — array of trimmed non-empty strings

Return Zod errors in the `{ success: false, error }` response so the client can display them.

## Server Action

`updateItem(itemId, data)` in `src/actions/items.ts` following the `{ success, data, error }` return pattern. Validates input with Zod, gets session via `auth()`, validates ownership, calls query function.

## Data

- Query function in `lib/db/items.ts` — `updateItem`
- Tag handling on update: disconnect all existing tags, connect-or-create new ones
- Returns updated `ItemDetail` so the drawer can refresh without a second fetch

## Notes

- Keep it simple — no form library needed, use controlled inputs with local state
- Client-side: disable Save button when title is empty (basic UX guard)
- Server-side: Zod validates all fields in the server action (source of truth)
- The content textarea doesn't need to be a code editor — that comes later
- After save, call `router.refresh()` so the underlying card list reflects changes
