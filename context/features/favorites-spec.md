# Favorites Page

## Overview

Add a /favorites page displaying all favorited items and collections in a compact, dev-focused list.

## Requirements

- Add star icon button to TopBar linking to /favorites
- Create /favorites route with protection
- Fetch all user favorited items and collections
- Compact list view (VS Code/terminal style, not cards)
- Each row: type icon, title, type badge, date added
- Separate sections for items and collections with counts
- Click item opens ItemDrawer, click collection navigates to /collections/[id]
- Empty state when no favorites
- Sort by most recently favorited (updatedAt)

## UI Style

- Monospace or semi-monospace font
- Minimal padding, high density
- Subtle hover states
- No cards or heavy borders, clean lines only
