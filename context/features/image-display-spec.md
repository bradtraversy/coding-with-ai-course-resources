# Image Gallery View

## Overview

Add image gallery view with lightbox for the Images item type.

## Requirements

- Create ImageGrid component with responsive thumbnail grid
- Create ImageLightbox component (full-screen modal, dark backdrop)
- Update /items/image to use ImageGrid instead of ItemList
- Images open in lightbox, not drawer
- Lightbox shows image, title, file info
- Lightbox actions: download, delete with confirmation
- Keyboard nav: Escape to close, arrow keys for prev/next
- Close on backdrop click
- Delete removes from local state, closes lightbox first, shows toast
