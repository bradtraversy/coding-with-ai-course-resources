# Dashboard UI Layout Spec

## Overview

Create the layout for the dashboard. Do not add any functionality. This is just the skeleton/design.

## Requirements

- Basic layout with sidebar and main content area
- Main area will have 6 collections (dummy data) in a 3 column grid in cards that are color coded with an icon. Use the @context/project-overview.md file to check the colors and icons
- Recent items under collections. Show the latest 20 and categorize them together. Color code the border of the cards in a 3 column grid.
- Collapsible sidebar with navigation
- Responsive design (sidebar becomes drawer on mobile)
- Dark mode styling
- Use shadcn/ui components
- 4 column row of stat cards with total collections, total items, favorite collections, favorite items
- Dummy descriptions for collection and item cards
- Server component for layout, client for interactive sidebar toggle
- Placeholder content for now (no data fetching yet)

## References

- @context/screenshots/dashboard-mockup.png
- @context/project-overview.md
