# Levels of AI Assistance

AI assistance in software development isn't a binary choice — it's a spectrum. Understanding where different tools and approaches fall on that spectrum will help you pick the right one for the right situation.

## Level 1: Autocomplete and Tab Completion

This is passive AI. You're writing most of the code yourself, and the AI suggests the next line as you type. Hit tab, it fills it in. You're in maximum control, but it's also the slowest approach.

If you're still learning a language or framework, this is where you should be — if you use AI at all. Getting suggestions while you're typing is very different from having AI generate entire features for you, and the learning value is much higher.

## Level 2: AI-Assisted Editors

Now the AI can do more. These tools have an agentic chat interface built into your editor, but they also have inline capabilities — you can highlight a block of code and say "refactor this to use async/await" or "add error handling here." They can make changes across multiple files, generate entire functions, and handle quick refactors.

You're still guiding the direction, but the AI handles the implementation details. You review what it produces and iterate. Faster than Level 1, and you still have solid control and understanding of what's happening.

## Level 3: Chat Interfaces and CLI Tools

This is the sweet spot — but only if you already understand the technologies you're working with, know how to structure a project, and can debug effectively. This is where the course lives.

Here you're having a real back-and-forth conversation with the AI about your project. The way I think about it: you're the architect, the AI is the builder. The AI implements most of the code, but you're directing the work, reviewing every decision, inspecting what gets created, and testing as you go.

This is significantly faster than writing everything yourself. What separates it from vibe coding is that you still understand what's being built. You're making architectural decisions, guiding the implementation, and maintaining full ownership of the codebase. You can also layer in subagents, custom commands, and context management to tighten up the workflow — all things we'll get into throughout the course.

## Level 4: Autonomous Agents

Tools like Devin operate at this level. You define a task, walk away, and the AI does everything — researches solutions, writes code, debugs issues, makes decisions autonomously.

The speed is real, but so is the tradeoff. You're not in the loop during the process. You're reviewing results after the fact with limited visibility into the decisions that were made. This works well for well-defined, isolated tasks: data migrations, repetitive work, things you can afford to audit thoroughly after completion. But it's not how you want to build your main features. You need to understand how your application works.

## Level 5: Vibe Coding

This is where you say "build me an app that does X" and have no meaningful involvement in what gets created. You're not structuring the project, not involved in any critical decisions, just going off the vibe. One-shotting — trying to generate an entire project from a single prompt — falls here too.

Is it fast? Sure. Is it professional development? No. You don't understand the code, can't debug it, can't maintain it, and you're not learning anything in the process.

Where it does have value: throwaway code, quick prototypes, and exploring ideas before committing to an approach. For production code or anything you're shipping to real users, this isn't the way.

---

We'll generally operate at Level 3 throughout this course — AI as the builder, you as the architect and tester.

## The Tools

New AI development tools seem to appear daily, so this isn't exhaustive — but here are the most relevant ones organized by level.

**Level 1 — Autocomplete**
- **GitHub Copilot** — One of the originals. Started with autocomplete and now includes a full chat interface.
- **Tabnine** — One of the earliest AI autocomplete tools.
- **VS Code built-in AI** — Microsoft's native autocomplete, now baked into the editor.

**Level 2 — AI-Assisted IDEs**
All three of these are VS Code forks, so the interface will be immediately familiar. Your extensions and settings carry over.
- **Cursor** — Inline AI editing plus a chat interface.
- **Windsurf** — Similar feature set to Cursor.
- **Kiro** — Newer entrant in the same space.

**Level 3 — Agentic CLI and Chat Tools**
- **Claude Code** — Anthropic's CLI. Also available as a VS Code extension. My top pick.
- **Codex CLI** — OpenAI's CLI and extension. A strong second.
- **Gemini CLI** — Google's CLI. Free for most users, though not as capable as the others at the moment.

**Level 4 — Autonomous Agents**
These operate more like robot developers than coding assistants. I haven't used any of them personally — I'm not interested in development where I'm not the architect.
- Devin, AutoGPT, Smol Developer

**Level 5 — Browser-Based Prototyping Tools**
Give these an initial prompt and they generate a starting point. Useful for prototyping, not much else.
- **Lovable**, **Bolt**, **Vercel v0**

## What I'll Be Using

Throughout this course I'll be using **Claude Code** — both as a CLI and a VS Code extension. It's the best tool available right now in my view. OpenAI's Codex is a solid second. Cursor comes third, though some people prefer it because of the integrated inline features.

For a while I ran both: Cursor as the IDE for inline tools, and Claude Code as my chat agent — best of both worlds. But I wasn't reaching for the inline features that often, so I went back to VS Code. It runs smoother for me.

Use whatever works for you. The workflow we build translates across tools.