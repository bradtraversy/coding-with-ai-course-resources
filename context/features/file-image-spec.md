# File Upload with Cloudflare R2

## Overview

Add file and image upload functionality using Cloudflare R2 storage.

## Requirements

- Create upload API route for R2
- Create FileUpload component with drag-and-drop
- Update CreateItemModal to use FileUpload for file/image types
- Delete files from R2 when items are deleted
- Create download proxy API route (avoids CORS issues)
- Add download button in ItemDrawer for file types
- Show upload progress indicator
- Display image preview for images, file info for files
- Max file size: 10MB
- File types: .pdf, .doc, .txt, .zip, etc.
- Image types: .jpg, .png, .gif, .webp
