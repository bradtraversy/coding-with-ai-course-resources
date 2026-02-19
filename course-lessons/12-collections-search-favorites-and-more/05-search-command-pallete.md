# Search & Command Palette

One of the most important things in a dev tool like this is a fast and easy search tool. I want to keep the filter bar but also have a Cmd+K shortcut to open a command palette for quick find. I want to implement fuzzy search. Fuzzy search is a technique that finds matches even when the search query doesn't exactly match the target data. Instead of requiring a precise, character-for-character match, it accounts for typos, misspellings, abbreviations, and similar-but-not-identical strings.

## Feature Spec

There is a lot here, so we will create a new feature doc at `/context/features/global-search-spec.md`. Add the course content for this file.

Run the following:

```text
/feature load global-search-spec.md

/feature start
```

This may take some iteration. Be sure the shortcut works and be sure that the drawer opens when the item is clicked.

Once you are happy with it, review and complete the feature.
