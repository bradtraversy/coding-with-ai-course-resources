# Item Create

## Overview

Add new items via a modal dialog. Opens from "New Item" button in top bar.

## Requirements

- Use shadcn Dialog component
- Type selector (snippet, prompt, command, note, link)
- Fields shown based on selected type:
  - All types: title (required), description, tags
  - snippet/command: content, language
  - prompt/note: content
  - link: URL (required)
- Server action `createItem` with Zod validation
- Query function `createItem` in `lib/db/items.ts`
- Toast on success, close modal and refresh
