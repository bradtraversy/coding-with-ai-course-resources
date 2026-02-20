# Levels Of AI Assistance

There are different levels of AI assistance when it comes to software development. I want to go through those and then in the next lesson, we'll talk about some of the tools as well.

The levels of AI assistance we can use in our code isn't a binary choice - it's not "use AI or don't use AI." It's a spectrum, and understanding where different tools fall on that spectrum will help you choose the right tool for the right job.

We'll talk about the different levels, then look at some of the tools.

## Level One: Tab completion and autocomplete

This is where you do most of the coding yourself, but you get some help through autocomplete and suggestions. This is **passive AI** as oppose to some of the other **agentic AI** tools. These will suggest the next line of code as you're typing. You hit tab, it fills it in. You're still writing most of the code yourself, the AI is just helping you type faster. This is maximum control, but it's also the slowest approach. Also, It think it's important to mention if you're just learning a language or framework, this is what you SHOULD use, if any AI at all.

## Level 2 is AI-assisted editors

Now we're getting a bit more powerful. These tools have an agentic chat interface built into your editor, so you can use them like level 3, which I'll talk about next, but there's other features like inline AI ability. You can highlight some code and say "refactor this to use async/await" or "add error handling here." They can make changes across multiple files, generate entire functions, do quick refactors.

You're still guiding the direction, but the AI is implementing the details. You review what it does and iterate. This is faster than Level 1, you still have good control, and you understand what's happening.

## Level 3: Chat Interface/CLIs & Extensions

This is the sweet spot IF and only IF, you already know the technologies you're dealing with, you understand how to structure your projects and debug, etc. This is what we're going to focus on in this course.

This is where you're having a real back-and-forth conversation with the AI about your project. The way I like to look at it is that you're the architect, the AI is the builder. The AI implements most of the code, but you still have control and you're putting the pieces together, inspecting and testing everything.

This is significantly faster than typing everything yourself. One thing that is really important that separates this from vibe coding is you still understand everything that's being built. You're reviewing the code, you're making decisions about architecture, you're guiding the implementation. You can also get into creating subagents, commands, context. We'll get into all of this later.

## Level 4: Autonomous agents

These are tools like **Devin**, where you say "complete this task" and you walk away. The AI does everything. It researches solutions, writes code, debugs issues, makes decisions.

This is very fast. But there's a tradeoff - you're not really involved in the process. You're reviewing the results after the fact. Your understanding of what happened is limited. You have less control over the decisions being made. This is good for well-defined, isolated tasks like data migrations, repetitive work, things where you can afford to do a deep review afterward. But this isn't how you want to build your main features, because you need to understand how your application works.

## Level 5: Vibe coding and one-shotting

This is where you just say "build me an app that does X" and you have no idea how it works. You're just hoping the AI understood what you wanted and built it correctly. You don't structure it, you're not involved with critical decisions. You're just going off the "vibe". And one-shotting, refers to trying to create an entire project with one prompt.

Is it fast? Sure. Is it professional development? Absolutely not. You don't understand the code, you don't know what will break, you can't debug it, you can't maintain it. And honestly, you're not learning anything. What this is great for is throwaway code and prototypes and exploring ideas. But for production code? For a real business? This is not the way.

So we'll generally be in the level 3 range. AI will be the builder, but we'll be the architect and the tester.

Now let's look at some specific tools to work within these levels.

## Common AI Tools

It seems like there's 10+ new AI tools released every day. So I couldn't go over every single one. However, these are some of the most common general AI tools and where they fall in the different levels that we talked about, and some of these can be used for multiple levels.

#### Level 1 Tools

These are autocomplete and suggestion tools. They are usually installed as editor extensions.

- Github Copilot: This was one of the first of it's kind. It started with autocomplete and suggestions. Now it has a chat interface like the level 3+ tools.
- Tabnine: Was one of the first AI autocomplete tools.
- VS Code has it's own AI assisted autocomplete.

#### Level 2 Tools

These are full IDEs and can also be used in the same as the other levels, because they do have the chat interface. In fact, it seems all the tools want to have that same chat agent feature.

All three of these IDEs are clones of VS Code, so you'll already be familiar with the interfaces. It's not like learning a new IDE. You get all the same extensions and settings as VS Code.

- Cursor: IDE that has inline AI abilities as well as chat interface.
- Windsurf
- Kiro

#### Level 3 Tools

These are powerful agentic tools with a chat interface to interact with the AI and have it write code, run tools, modify files and more.

- Claude Code: Anthropic's CLI. Can also be installed as an editor extension. Most powerful in my opinion.
- Codex: Open AI's CLI/extension
- Gemini CLI: Google's CLI. Is free for most users but not as good as some of the others

#### Level 4 Tools

These tools are basically like robot developers. I'll admit that I haven't used any of these. I'm not really interested in any kind of development where I'm not involved and can't be the architect.

- Devin
- AutoGPT
- Smol Developer

#### Level 5 Tools

These tools are browser based and take an intial prompt to create something. The only thing I find these useful for is prototyping.

- Lovable: Browser interface where you give an initial prompt to one-shot or prototype
- Bolt
- Vercel's v0

So these are just some of the ai tools available. These are also the front to back tools. In addition to this, you have tools like AI code reviewers and testing. Where they focus more on a specific area.

## What We'll Be Using

You certainly can use what you want, but in this course, I'll be using Claude Code as both a CLI and a VS Code extension. I think it's the best tool at the moment. I've tried a few and I would say Open AI's Codex takes second place. Third, I would say is Cursor, however, some people want to use Cursor because it also has integrated AI features in the editor. What I was doing for a while was using the Cursor IDE, which gave me the inline tools, but then I would use Claude Code as my chat agent. So you kind of get the best of both worlds. However, I wasn't using the inline stuff as much, so I went back to VS Code, because I do think it runs a bit smoother than Cursor.

In the next section, I want to start to talk about prototyping and vibe coding.

