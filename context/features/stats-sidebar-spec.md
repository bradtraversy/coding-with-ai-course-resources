# Stats & Sidebar Spec

## Overview

Show the stats in the main area from the data in the database instead of the @src/lib/mock-data.ts file. 

Show the system item types in the sidebar and the actual collection data from the database.

## Requirements

- Display stats pertaining to database data, keeping the current design/layout
- Display item types in sidebar with their icons, linking to /items/[typename]
- Add "View all collections" link under the collections list that goes to /collections
- Keep the star icons for favorite collections but for recents, each collection should show a colored circle based on the most-used item type in that collection
- Create @src/lib/db/items.ts and add the database functions.Use the collections file for reference if needed


## References

-  @src/lib/db/collections.ts
