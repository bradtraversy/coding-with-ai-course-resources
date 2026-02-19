# AI Auto-Tagging

## Overview

Add AI-powered tag suggestions for items using the OpenAI "gpt-5-nano" model. Users click a "Suggest Tags" button in the tags area, and the AI returns 3-5 freeform tag suggestions based on the item's title and content. Each suggestion has accept/reject controls. Pro-only feature with both UI-level and server-side gating. If this is the first AI feature implemented, it also establishes the OpenAI foundation (client, server action, rate limit config) for subsequent AI features.

## Requirements

- Create OpenAI client utility with `AI_MODEL` constant (if not already created by a prior AI feature)
- Use the standard openai SDK and keep it simple
- Create `generateAutoTags` server action with auth, Pro gating, Zod validation, rate limiting
- Add AI rate limit config (20 requests/hour per user) to existing rate limit utility (if not already added)
- Add "Suggest Tags" button (Sparkles icon, ghost variant) near the tags input in create item dialog and item drawer edit mode
- Display suggested tags as badges with accept (check) and reject (X) controls per tag
- Accepted tags get added to the item's tag list
- Tags are freeform (not limited to existing tags in the database)
- Truncate content to 2000 chars before API call
- Hide the Suggest Tags button for free users (Pro-only UI gating)
- Error handling via toast (Pro gating, rate limit, AI service errors)
- Follow existing patterns
- Unit tests for server action

## CRITICAL: OpenAI SDK & gpt-5-nano gotchas

The `openai` npm package v6+ has TWO different APIs. **gpt-5-nano does NOT work with the Chat Completions API** — it returns empty content. You MUST use the **Responses API** instead.

### Use the Responses API (NOT Chat Completions)

```typescript
// CORRECT — Responses API (works with gpt-5-nano)
const response = await client.responses.create({
  model: 'gpt-5-nano',
  instructions: 'You are a developer tool assistant...',
  input: 'Suggest 3-5 tags for this snippet...',
  text: {
    format: { type: 'json_object' },
  },
});
const text = response.output_text; // <-- this is where the content is

// WRONG — Chat Completions API (returns empty content with gpt-5-nano)
const completion = await client.chat.completions.create({
  model: 'gpt-5-nano',
  messages: [{ role: 'user', content: '...' }],
});
// completion.choices[0].message.content will be "" (empty string)
```

### Key differences from Chat Completions

| Chat Completions | Responses API |
|---|---|
| `client.chat.completions.create()` | `client.responses.create()` |
| `messages: [{ role, content }]` | `instructions` (system) + `input` (user) |
| `response_format: { type: 'json_object' }` | `text: { format: { type: 'json_object' } }` |
| `completion.choices[0].message.content` | `response.output_text` |
| `max_tokens` / `max_completion_tokens` | not needed (or use `max_output_tokens`) |

### Other gotchas

- `max_tokens` is NOT supported by gpt-5-nano — use `max_completion_tokens` if using Chat Completions (but don't use Chat Completions, use Responses API)
- `zodResponseFormat` structured output consumes excessive tokens with this model and hits length limits — use `json_object` format instead and parse manually
- The model may return `{"tags": ["a", "b"]}` OR `["a", "b"]` — handle both formats
- Always normalize tags to lowercase after receiving them

## Notes

- `OPENAI_API_KEY` already in `.env`
- `isPro` is available server-side via session but not passed to create/edit UI components — use server-side gating for enforcement, UI gating for button visibility requires passing `isPro` as a prop or fetching it client-side
- See `docs/ai-integration-plan.md` for full architectural context
