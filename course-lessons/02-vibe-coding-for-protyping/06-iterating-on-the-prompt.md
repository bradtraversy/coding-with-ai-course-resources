# Iterating On The Prompt

So now we have a working prototype of our notes app. I want to continue to iterate on this a bit. Iteration is just the process of making incremental improvements, tweaking, refining, and building on what you already have rather than starting over from scratch.

This is a huge part of working with AI effectively. You're rarely going to get exactly what you want on the first try. And that's fine. The goal isn't to write a perfect prompt, it's to get something working and then shape it into what you actually need.

Think of it like sculpting. You start with a rough block, and each prompt is another pass with the chisel. You're not failing when the first result isn't perfect, you're just not done yet.

Let's look at what we have and figure out what to improve.

Here are some suggested changes:

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

So now we have a working prototype that we could bring into something like Claude Code or Cursor.

I typically don't do all this unless I want to test the idea first. What I usually prototype for is the UI. I will generally have it create a non-functioning mockup and iterate on that and then screenshot it for my context in my AI tool.
