# Bootstrap Your Projects Manually

Ok, so we're ready to start a project in Claude. Now some people will jump into Claude or Cursor or whatever it is and say create a Next.js application that does blah blah. I don't do that. One of the reasons is because it seems no matter the AI tool, when generating Next.js projects with Tailwind v4, they always seem to screw something up and the CSS doesn't show right and they use Tailwind 3 even if you specify version 4.

Now that's just one very specific reason to a specific stack. Overall, I would say you should bootstrap your project manually because it's a lot of files to generate and if you do it with the CLI or whatever tool, there's not going to be any technical debt and you know exactly what you're getting. It's just as easy to run `create-next-app` or `create-vite` as it is to prompt the AI. Actually, it's even easier. So why have the agent do it? You should be using AI to save time not just for the hell of it.

## Create Our Next.js app

Ok, so let's create a new project folder called "devstash".

```bash
mkdir devstash
code devstash
```

This will open the folder in VS Code. If you are using something else, just open the folder manually from there.

Open an integrated terminal and type the following:

```bash
npx create-next-app@latest . --src-dir
```

I like to have a `src` folder, so I added the `--src-dir` flag.

Go through all the prompts and use the defaults.

Now in your terminal, run `npm run dev`

Open your browser at `http://localhost:3000`.

We now have a Next.js app with Tailwind v4 ready to go.

Now, before we move on, let's open Claude and just do a little bit of cleanup. You can also get used to using it within VS Code.

Let's go ahead and feed it a prompt:

```text
I have a fresh next.js install. Clean up the boilerplate. The @page.tsx should simply show an h1 that says "Devstash". Remove all the default styles from globals.css except the Tailwind import.
```

So what we'll see is every file it reads, every file it wants to change, and a diff showing exactly what those changes are. Claude Code will ask for your approval before making any changes - you're always in control.

Once you approve, check your browser. You should see a clean page with just "Devstash" as the heading. No more Next.js boilerplate.

This is a simple example, but it shows the workflow: you direct, Claude executes, you approve. You can set to always approve, but I would not recommend it at this point.

Claude can also create, read, update and delete files. Let's delete the unneeded SVG files:

```text
Lets get rid of the svg files in the public folder
```

You will see that Claude will run something similar to the following commands:

```
Search(pattern: "public/*.svg", path: "~\Code\course-code\devstash")
Bash(rm C:/Users/trave/Code/dev/devstash/public/*.svg)
```

It's just searching and running the `rm` command in a bash terminal just like you would. You'll also see it use `grep` for searching file contents. These are standard terminal utilities that Claude runs on your behalf.

