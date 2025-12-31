# Different Levels Of AI Assistance

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
