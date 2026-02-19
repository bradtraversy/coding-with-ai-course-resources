# Section 15 Prompts

## Font Size Prompt

```text
I have some concerns about the font size in certain areas, specifically the item drawer. The code editor is good as that is controlled by the user. The rest of the drawer seem really small as well as the markdown editor for types that are not snippets and commands. Use Playwright to inspect the UI and review the font sizes and make suggestions
```

## UI Review Prompt

```text
Use the ui reviewer and Playwright and give me any overall suggestions that you may have for the UI layout. A couple things that I want to mention is there is no sidebar highlighting of links and there is no github button on the register page. Add those in your report. Keep the report concise with straightforward results. Use Playwright not just code review
```

## Refactor Scanner Prompt

```text
I want to create a subagent called "refactor-scanner" that takes in an argument of the folder to scan for duplicate code that can be put into seperate utility functions, components, etc. It should take in folders like actions, components, lib, api, hooks and all. Tailor the instructions to the type of folder/code
```