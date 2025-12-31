# Section 15 Prompts

## AI Auto Tagging Feature Prompt

```text
/feature load Implement AI auto-tagging for items using OpenAI GPT-4o Mini. Install OpenAI SDK, create src/lib/openai.ts with lazy client initialization, add generateAutoTags server action with Pro user gating, add Suggest Tags button to item create/edit forms, show tag suggestions with accept/reject UI, include loading states and error handling.
```

## AI Summaries Feature Prompt

```text
/feature load Implement AI summaries for items using OpenAI GPT-4o Mini. Add generateSummary server action in src/actions/ai.ts with Pro user gating. Generate concise 1-2 sentence summaries from item title, content, and type. Add "Generate Summary" button (sparkles icon) next to the description field in CreateItemModal and ItemDrawer edit mode. Auto-populate the description textarea with the generated summary. Truncate long content to 2000 characters before API call. Limit summary output to ~150 characters. Include loading states, Pro user tooltip for disabled state, and error handling with toasts.
```
