# Context Commands

Now that you know the basics of context, let's start to look at working with Context in Claude Code.

I know we haven't done much in our project yet, but we'll get to that. I want you to run the following command:

```
/context
```

This is probably the command that you'll use the most. This will show you your context window including the amount of tokens that have been used for this specific session. We have X of 200k tokens used.

It also shows the model you are using and a visual representation of what the tokens were spent on. You have:

**System Prompt** - The base instructions that tell Claude how to behave. This is baked in by Anthropic and you don't control it. It's always there, always using tokens.

**System Tools** - The built-in capabilities Claude Code has like reading files, writing files, running bash commands, searching your codebase. These tool definitions take up space.

**MCP Tools** - If you've connected any external tools through the Model Context Protocol (we'll cover this later), they show up here. Things like database access, API connections, or custom tools you've set up.

**Messages** - This is your conversation history. Every prompt you've sent, every response Claude has given, every file it's read, it all accumulates here. This is usually what fills up your context.

**Free Space** - What you have left to work with. When this runs out, Claude starts "forgetting" earlier parts of your conversation.

## It Fills Up Fast

200k may sound like a lot, but watch this. Type in the following:

```text
Look at @package.json
```

Now type `/context` again. Just looking at that file took 1k - 2k tokens. So it adds up VERY fast.

So this is a very big part of your workflow is constantly checking what you have in context. Because if this fills up, Claude becomes a complete idiot and starts forgetting important stuff. If I'm using a 200k model, I try not to let it get past around 175k. What sucks, is depending on the size of your project and your context files, you can spend 80, 90k just opening up a tab.

Now once your context is starting to fill up, you can do a couple things:

- `/clear` - This will go ahead and wipe your context clean. Just like the 50 First Dates movie, it's like a new day. Just keep in mind that Claude won't remember what you just had it do. There's different ways to handle this. What I'll do is have it create a summary document of what's been done and what is to be worked on next. Then you would pass that to the next context.
- `/compact` - Instead of nuking everything, compact will summarize your conversation and keep the important context while freeing up space. It basically says "hey, here's what we've been working on and what we've accomplished" in a condensed form. You lose the granular back-and-forth, but you keep the key decisions and current state. It's like writing notes at the end of the day instead of remembering every word of every conversation.

Personally, I'd rather summarize and then clear the context. I've had better luck with that than using `/compact` and it frees up a lot more. You'll start to build your own workflow as you use it more.

## Auto Compact

So if you don't manage your own context and you run out of tokens for that session, what it will do is auto compact. It's like running the `/compact` command, except it does it automatically. I would suggest not letting this happen because you never know when it will compact and it could do it at a really bad time when you're in the middle of fixing an important issue. So I suggest basically using a session for a feature. When that's complete, summarize and clear.

Alright, so now that we got context out of the way, in the next section, we'll start really planning our project.
