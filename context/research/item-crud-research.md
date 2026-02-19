# Item CRUD Architecture

## Output

`docs/item-crud-architecture.md`

## Research

Design a unified CRUD system for all 7 item types:
- Mutations (create, update, delete) in one action file
- Data fetching in lib/db (called directly from server components)
- One dynamic route, shared components that adapt by type

## Include

- File structure (actions for mutations, lib/db for queries, routes, components)
- How `/items/[type]` routing works
- Where type-specific logic lives (components, not actions)
- Component responsibilities

## Sources

- @context/project-overview.md
- @docs/content-types.md
- @prisma/schema.prisma
- @src/lib/constants.tsx
