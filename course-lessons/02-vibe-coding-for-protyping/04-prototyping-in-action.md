# Prototyping In Action

So we talked about how prototyping can really help you get your idea out there. I've needed to do this for multiple reasons:

1. Just to get an idea of what my project will look like. Then throw it away.
2. Create a prototype as a starting point before writing any real code.
3. To show someone else my idea

There's others as well, but these three I have done quite a bit.

## Let's Create A Prototype

Now we are going to actually create something. Like I said, I want to start off by creating a simple Markdown notes editor. You can use any tool to do this, but I'm going to use Vercel's v0. They have a really generous free tier compared to some of the others and it generally creates pretty good stuff.

Let's use our simple prompt template to do this. Many times, I will create the prompt in a markdown editor so that I can format it nicely then I'll paste it into the input. If I'm using a tool like Claude Code or Cursor, I will put it in a file and just feed that file to the AI.

For this, I will open up a markdown or text editor and type the following:

```
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

Since this is a prototype and we are not keeping this code, the structure and tooling is not all that important. The only thing I really care about at this point is seeing it work.

Let's run this and see what we get.

Once it's done, give it a try. Create a new note, edit, delete. Try the mode toggle. Test the search and filter note functionality.

In the next lesson, we'll take a look at what was generated.
