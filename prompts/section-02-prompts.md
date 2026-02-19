# Section 02 Prompts

## Notes App Prompt

```text
I want to prototype a markdown note-taking app in React. Here are the requirements:

FEATURES:
- Create, edit, and delete notes
- Live markdown preview (split view - editor left, preview right)
- Auto-save to localStorage with debouncing
- Sidebar showing all notes with title and date
- Search functionality to filter notes
- Dark/light mode toggle

TECHNICAL REQUIREMENTS:
- Use React with functional components and hooks
- Use react-markdown for preview rendering
- Responsive design (mobile-friendly sidebar)
- Clean, modern UI with Tailwind v4

STRUCTURE:
- Break UI into separate components where it makes sense
```

## Notes App Iteration Prompts

Prompts to change some things in the notes prototype:

```text
Change the colors to a blue/green scheme
```

```text
Add a delete confirmation. Not a browser prompt but a nice modal.
```

```text
Add a word count and character count display at the bottom of the editor panel. Show it in a subtle, non-distracting way - small text, muted color. Update the counts in real-time as the user types.
```

```text
Add a simple formatting toolbar above the editor with buttons for: Bold, Italic, Heading, Link, Code, and Bullet List. When clicked, each button should insert the appropriate markdown syntax at the cursor position or wrap the selected text.
```

```text
Add a download button that exports the current note as a .md file. The filename should be the note title (lowercase, spaces replaced with dashes) plus the .md extension. Place the download button near the other note actions.
```
