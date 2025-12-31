# Item CRUD Architecture

## Output

`docs/item-crud-architecture.md`

## Research

Design a unified CRUD system for all 7 item types. One action file, one dynamic route, shared components that adapt by type.

## Include

- File structure (actions, routes, components)
- How `/items/[type]` routing works
- Where type-specific logic lives (components, not actions)
- Component responsibilities

## Sources

- `docs/content-types.md`
- `prisma/schema.prisma`
- `src/lib/constants.tsx`
