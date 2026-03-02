# CLAUDE.md File

So we setup our initial files and we also created a planned out spec file.
Now I want to go over the most important doc when using Claude Code, which is the `CLAUDE.md` file. Every agentic AI tool has a specific file that is used for persisted context and rules. This is looked at with every new session. It's a way of passing things in memory from one session to the next. If you're using Cursor, you place `.mdc` files in the .`cursor/rules/` folder. In Codex, it's called `AGENTS.md`. So if you're using something else, just call the file whatever it's supposed to be called for that tool.

## `/init` Command

You can create the `CLAUDE.md` file manually, but there is also a command to create it. If you run `/init` it will analyze your project and generate a `CLAUDE.md` file based on what it finds. For us, we have nothing but a boilerplate, so we'll just overwrite it, but let's go ahead and run `/init`.

So it goes through the codebase and gives us a `CLAUDE.md` that basically just has the tech stack. There's nothing else really here yet. If this were an existing project, it would be much more in-depth.

Now the way that I like to do this for larger projects is to have the `CLAUDE.md` file point to 3 or 4 other files. You can put everything in here, but it can get kind of messy.

Generally, what I like to put are the following:

- **project-overview.md** (We already created in a doc)
- **coding-standards.md**: This specifies our coding style. For instance, I want to use strict TS and always default to Next.js SSR and then dynamic client components.
- **ai-interaction.md**: This is where I specify how I want the AI to interact with me. Usually I want it to be concise and to the point. I want it to check with me before committing, things like that.
- **current-feature.md**: This is what we are working on right now. This should be pretty short and it will change often.

So let's add the following to the `CLAUDE.md` file:

```markdown
# DevStash

A developer knowledge hub for snippets, prompts, commands, notes, files, images, links and custom item types.

## Context Files

Read these for full project context:

- @context/project-overview.md: Features, data models, tech stack, UI/UX
- @context/coding-standards.md: Code conventions and patterns
- @context/ai-interaction.md : Workflow and communication guidelines
- @context/current-feature.md: What we are currently working on

## Tech Stack

- Next.js 16 (App Router, Server Components)
- TypeScript (strict)
- Prisma + Neon PostgreSQL
- NextAuth v5 (Email + GitHub)
- Tailwind CSS v4 + shadcn/ui
- Cloudflare R2 (file storage)
- OpenAI gpt-5-nano
- Stripe (payments)

## Quick Commands

```bash
npm run dev      # Start dev server
npm run build    # Build for production
npm run lint     # Run ESLint
```


## Project Spec -> Project Overview Context

So we have our main `CLAUDE.md` context file and we have a documentation spec file as well. I want that spec to always be in context for Claude to reference. So we want to point to it in the `CLAUDE.md` file. However, I like to run it through AI and have it format it nicely and add things like the Prisma models and data formatting. Then I'll have that new formatted file put in the a folder called `context`.

Let's go ahead and run this through an AI. Which model and program you want to use is up to you, however, where this is more high-level and it doesn't need anything from our project beside what we give it, I'll usually use either https://chatgpt.com or https://claude.ai. You can certainly use your CLI or IDE as well.

So let's open up https://chatgpt.com and add the following prompt:

```text
I'm planning a SaaS project called DevStash. Below are my planning notes. Review and clean up as you see fit.  Format with things like Prisma models (specify it is a rough draft), diagrams, Icons, links and any other info that you think is relevant to this project. Put it in a file called project-overview.md:

[PASTE YOUR SPEC FILE]
````

You should get a new file with your formatted document. Put that `project-context.md` file in the `context` folder.

It's up to you, but you can now delete the `project-spec.md` file because we essentially have a better version of it in our context folder.

In the next lesson, we'll define the rest of the files that I want in context.
