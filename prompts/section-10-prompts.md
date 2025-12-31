# Section 10 Prompts

## Listings Page Prompt

```text
Add a new feature to the @context/current-feature.md file:

Create the items listings page/functionality. It should display items filtered by type. This will be a single feature that works for all item types (snippets, prompts, notes, etc).

URLs should use a dynamic route pattern: /items/snippets, /items/notes, etc

Make it a responsive grid of cards with a left border color with the type color.
```

## Code Scan Prompt

```text
Use the code-scanner subagent to scan the entire codebase for security issues, bugs, bad code including unused or repeated code, optimizations and any other issues that stick out
```

```text
Add the quick wins that carry little to no risk to the @context/current-feature.md file.
```

## Vitest Setup Prompt

```text
Set up Vitest for unit testing. We only want to test server actions and utilities, not components.

Update the workflow in @context/ai-interaction and any other docs where you see fit.
```

## Item Details Drawer Prompt

```text
/feature load Implement the details view for items in a snappy modern drawer.

The extras like the code editor and item-specific stuff will come later. For now, let's just work on the drawer details display.
```

## Check Drawer With Playwright Prompt

```text
Login to /sign-in with  demo@devstash.io/12345678 and click on "Snippets" in the sidebar, then click on a snippet. Check the drawer and let me know if you have any suggested improvements. I think it needs more padding on the left.
```

```text
/feature load Implement the details view for items in a snappy modern drawer.

The extras like the code editor and item-specific stuff will come later. For now, let's just work on the drawer details display.
```

## Item Delete Prompt

```text
/feature load Create the delete functionality for items. There should be a Shadcn confirmation and a toast on success.
```

## Item Create Prompt

```text
/feature load add a create button to create a new item. This should open a modal with a type dropdown. Some fields will  depend on the type. Only show the type-specific fields when that type is selected.

Note and prompt items will be able to accept markdown. Add that as an info blurb near the text field.

Files and images will have an upload field but no functionality yet.

Snippets and commands will have an editor but we will do that later.
```

## Code Scan Prompt

```text
Use the code-scanner subagent to check the codebase for issues and report back
```
