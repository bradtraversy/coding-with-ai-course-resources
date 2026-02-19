# What Are Subagents

Subagents in Claude Code are specialized AI assistants that can be invoked to handle specific types of tasks. It's important to mention that if you are using something other than Claude, chances are they have something like this available. For instance, Cursor has similar functionality with Background Agents. So if you're following along, you can create a background agent in Cursor to do the same stuff we are.

Subagents enable more efficient problem-solving by providing task-specific configurations with customized system prompts, tools and a separate context window.

The separate context window is what really makes these useful.

One thing you have to remember though, is that the main agent and your subagents don't share context or memory other than what the subagent reports back to the main agent. So if you have a subagent do a specific task and then you mention something specific to the main agent, it may not know what you're talking about and things can get confusing.

So the best cases for subagents are one-off tasks like doing a scan or a review of some code and reporting the results to the main agent. Or doing a single feature where everything can be maintained in that context.

## Built-In Subagents

You can create your own subagents and we will, but there are also some built-in agents that Claude uses and it uses these on the fly and you can also request them.

**General Purpose Subagent**: This is the default agent that Claude uses to read and write code, run tools, etc. It acts as a fallback or primary agent for tasks that do not fit within the defined domains of any custom subagents you might have created.

- **Explore Subagent**: A fast lightweight agent optimized for searching and analyzing codebases. It operates in strict read-only mode and is designed for rapid file discovery and code exploration.

- **Plan Subagent**: The Plan subagent is a specialized built-in agent designed for use during plan mode, which is non-execution mode. It's used to conduct research and gather information about your codebase before presenting a plan.

You can explicitly spawn these agents in your prompts.

I haven't done this in the course yet, because I wanted to talk about them first, but typically if I want to do something like:

- Find a specific piece of code
- Do a quick review of something
- Make a quick fix

I would say something like:

"Launch the explore agent to see if there are any performance optimizations we can make"

That way, we do this without using our context from the main agent.

## Custom Subagents

Not only can you spawn a built-in subagent but you can create completely custom agents for specific tasks. Maybe you want a **debugging agent** or **code review agent**.

## Personal & Project Agents

you can create a personal agent which will be available to your user across projects or a project subagent, which is available to everyone in your project. Project is the more common option.

Depending on the type, the location will be different:

- Project: /projectfolder/.claude/agents
- Personal: ~/.claude/agents

You can also run the following command:

`/agent`

And create from there. It will also list the built-in agents we talked about above.

## Commands Vs Agents - When To Use Which

You may be confused on when to use a command vs a subagent. Here are some guidelines:

Use a command:

- Quick repeatable tasks
- Workflow automation
- Same steps every time

Use an agent:

- Deep exploration
- Autonomous analysis
- Needs to search and think

In the next lesson, we will create a subagent to review the entire codebase and look for issues and optimizations. We will use this along with our custom command for the rest of the course.
