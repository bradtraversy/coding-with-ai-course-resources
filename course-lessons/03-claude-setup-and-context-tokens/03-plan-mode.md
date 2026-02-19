# Plan Mode


Plan mode is where you interact with the AI, but it doesn't operate as an agent, meaning it does not write code or manage files. It basically is just an enhanced chatbot with access to your project files. You can enter plan mode by cycling shift+tab.

Plan mode is great for learning. I say all the time that beginners should never rely on AI to write their code, however, they should use AI to teach them. And plan mode is great for that. It also obviously great to plan out a project or plan a new feature. I'll be honest, I don't use it all that much, but a lot of people do.

Let's just use it to plan a new feature for our Python script.

Enable plan mode and enter the following prompt:

```text
I want to make this joke script more interactive. Give me some ideas.
```

It will show you a list of ideas. Just go through the prompts and see what it offers you.

Select one or more of the ideas and then switch to agent mode and tell it to implement it.

It will construct a plan markdown document at `~/.claude/plans/your_plan.md`

It will then ask you if you want to implement the plans.

It will take you out of plan mode when you accept the plans.