# Global Search / Command Palette

## Overview

Add a global command palette (Cmd+K / Ctrl+K) with fuzzy search across items and collections.

## Requirements

- Open with Cmd+K (Mac) / Ctrl+K (Windows)
- Fuzzy search across all items and collections
- Grouped results: Items section, Collections section
- Keyboard navigation (arrow keys, Enter to select)
- Show item type icon and collection item count
- Navigate to item drawer or collection page on select
- TopBar search input opens palette on click
- Show ⌘K hint in search input placeholder

## Technical

- Use shadcn `cmdk` component (Command)
- Client-side fuzzy search (no server round-trips)
- Pre-fetch searchable data on app load
- Search data: items (id, title, type, content preview), collections (id, name, itemCount)
- Reuse existing data fetching functions
