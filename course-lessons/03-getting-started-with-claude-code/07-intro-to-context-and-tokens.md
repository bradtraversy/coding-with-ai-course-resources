Alright, so before we start building features, we need to talk about one of the most important concepts in AI coding: context. If you don't understand context, you're going to have a frustrating time with Claude Code - or any AI coding tool for that matter. You'll wonder why the AI "forgot" what you told it five minutes ago, or why it's not following the patterns in your codebase. If you're like me, you'll up cursing and threating your AI and we don't want that. Especially if it one day gains consciousness and then plots to ruin your life.

## What Is Context?

So what is context? Context is everything the AI can "see" at any given moment. Think of it like short-term memory.

If you've never seen the movie 50 First Dates with Adam Sandler and Drew Barrymore, basically Drew Barrymore's character got into an accident and damaged her brain to where she can only remember in increments of 24 hours. So everyday she wakes up, she has a clean slate that starts from the day of her accident. This is exactly how AI context windows work. They remember a certain amount of information and then it's gone.

### What Is In Context?

- The messages in your conversation
- Any files you've referenced
- The system instructions
- Its own responses

Every time you start a new conversation with Claude, Cursor or ChatGPT, you're starting fresh. It has no idea who you are, what project you're working on, or what you talked about yesterday unless it's still within that **context window**, which is how much it can hold at once.

## Why Context Windows Matter

This is important because when you're working on a real project, you have dozens of files, design decisions, dependencies, coding patterns you're following. The AI doesn't know any of that unless you tell it.

If you just say "add a delete button to the component" Claude has no idea:

- What framework you're using
- What your existing code looks like
- What styling approach you're using
- What the component even does

So it guesses. And those guesses might be completely wrong for your project.

This is where context engineering comes in - it's the practice of strategically feeding the AI the right information so it can actually help you. We're not just prompting anymore. We're managing what the AI knows.

The good part about this is that we can automate a lot of this. That's what files like CLAUDE.md are for, which we'll talk about soon. They give the AI instant context about your project the moment it starts working.

## Tokens

You'll hear the term "tokens" thrown around a lot when talking about AI. Context windows and API pricing are measured in tokens.

A token is basically a chunk of text. Not exactly a word, not exactly a character - somewhere in between. The AI breaks down everything you send it into these tokens before processing.

LLMs, like GPT-5 and Claude Sonnet, learn from vast amounts of text. Breaking text into tokens helps the model understand and predict text more efficiently. It's like learning a language by studying individual words and phrases rather than entire books at once.

Now every model has specific pricing per certain amount of tokens, however, that's if you're paying API prices directly. If you have a subscription to Claude Code or Cursor, you're charged a fixed price, and you're alloted a certain amount of tokens every 5 hours or whatever it is. If you decide to actually integrate an LLM into your app, like I have a SaaS I'm working on at vidpipe.ai that uses GPT-5 to convert Youtube videos into articles and newsletters. Im using the OpenAI API, so I pay for tokens directly. But with these coding tools like Cursor and Claude Code, you can have a fixed subscription.
