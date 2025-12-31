# Small Item Display Features

There are a few things I would like to add that are missing that I think are too small for their own feature doc.

Create a new spec file at `context/features/small-enhancements-1.md` and add the following:

```markdown
# Add Small Enhancements

## Overview

Enhance item cards with quick copy, syntax highlighting, URL previews, and type-specific add buttons.

## Requirements

- Add quick copy button on preview cards (not just drawer)
- Add syntax highlighting for snippet and command type previews
- Add URL preview with favicon for link type items
- Add "Add [Type]" button on each item listing page (e.g., "Add Snippet" on /items/snippet)
- Type-specific buttons bypass type selection, go directly to form
- Reuse existing modal, do not create new components
```

## Load Feature

Load the feature and start with the following:

```text
/feature load small-enhancements-1.md

/feature start
```

Check the implementation manually and then run:

```text
/feature review
/feature complete
/clear
```

I don't think there is anything worth testing here.
