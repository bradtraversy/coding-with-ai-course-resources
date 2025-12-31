# Feature: Explain Code

## Overview

AI-powered code explanation for **Snippets and Commands only** in ItemDrawer. Pro users only.

These are the two item types where "explain" makes sense - actual code and terminal commands. Other types (Prompts, Notes, URLs, Files, Images) are already human-readable or non-code content.

## UI Design

- **Button**: "Explain" with Sparkles icon in CodeEditor window controls header (next to Copy button)
- **Display**: Tab-based interface - after clicking Explain, Code/Explain tabs appear in the header
- **States**: Loading spinner while generating, error toast on failure, Pro-gating with tooltip and Crown icon

### Tab Behavior

- Initially shows only "Explain" button (no tabs)
- After first explanation is generated, shows "Code" and "Explain" tabs
- Tabs allow switching between code view and explanation view
- Explanation renders as markdown in the same container space

## Implementation

### Server Action (`src/actions/ai.ts`)

```typescript
explainCode({ content, language?, title? }) => { success, explanation?, error? }
```

- Validate Pro status
- Send to GPT-4o Mini with prompt for concise explanation
- Return explanation (~200-300 words)

### Components

1. Update `src/components/ui/code-editor.tsx` - Added explain functionality directly into CodeEditor:

   - New props: `showExplain`, `isPro`, `title`
   - WindowControls updated with Explain button and Code/Explain tabs
   - Tab state management for switching between code and explanation views
   - Uses MDEditor.Markdown to render explanations

2. Update `ItemDrawer.tsx` - Pass new props to CodeEditor for snippet & command types:
   - `showExplain={true}`
   - `isPro={isPro}`
   - `title={item.title}`

## Pro Gating

- Button shows Crown icon for non-Pro users
- Tooltip: "AI features require Pro subscription"
- Click shows toast error for non-Pro
- Server validates Pro status before API call

## Out of Scope

- Saving explanations to database
- Explain in create/edit forms
