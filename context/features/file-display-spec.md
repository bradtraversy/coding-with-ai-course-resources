# File List View Spec

## Goal

Update `/items/files` to display as a single-column list (like Google Drive/Dropbox) instead of grid cards.

## Requirements

- Single-column list layout with rows
- Each row shows: file icon (by extension), file name, file size, upload date, download button
- Row hover highlight
- Click row opens ItemDrawer
- Download button triggers direct download (stop propagation)
- Responsive: stack info vertically on mobile


