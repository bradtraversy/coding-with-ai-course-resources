# AI Summaries Feature

We now have auto tagging with the help of AI. Now let's do the same type of thing for the description by creating a summary with AI.

Let's run the following to add the current feature:

```text
/feature load Implement AI summaries for items using OpenAI GPT-4o Mini. Add generateSummary server action in src/actions/ai.ts with Pro user gating. Generate concise 1-2 sentence summaries from item title, content, and type. Add "Generate Summary" button (sparkles icon) next to the description field in CreateItemModal and ItemDrawer edit mode. Auto-populate the description textarea with the generated summary. Truncate long content to 2000 characters before API call. Limit summary output to ~150 characters. Include loading states, Pro user tooltip for disabled state, and error handling with toasts.
```

This should be pretty straightforward.

Try clicking on the icon next to the description. It should add the summary into the field.

If you see any issues, iterate and fix.

Once the summary button works, you can test, review and complete:

```text
/feature test
/feature review
/feature complete
/clear
```
