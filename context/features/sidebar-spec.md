# Sidebar Spec

## Overview

Show the system item types in the sidebar and the latest 6 collections under that.

## Requirements

- Display item types in sidebar with their icons, linking to /items/[typename]
- Show latest 6 collections below item types
- Add "View all collections" link under the collections list
- Each collection shows a colored circle based on the most-used item type in that collection
- Create server action in src/actions/collections.ts to fetch sidebar data

## Notes

- Color circle derives from the dominant item type's color in each collection
- Item type icons come from the icon field in the ItemType model
- Collections sorted by most recent
