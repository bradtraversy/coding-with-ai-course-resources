# Code Scanner

Remember in our workflow, toward the bottom of the diagram, I had "Periodically review codebase". I want to have a subagent that will scan for:

- Security Issues
- Performance Issues & Optimizations
- Code Quality Issues
- Patterns

We'll format it to have a very specific output with a range of severity.

## Using the `/agent` Command

Go ahead and type `/agent` within Claude Code and hit **enter**.

Then click **Create new agent**

Select **Project** for the type

Then select **Generate with Claude Code**.

It will ask what we want the agent to do. Let's add the following:

```text
Scan this Next.js codebase for:
- Security issues
- Performance problems
- Code quality
- Code that can be broken up into seperate files/components

Only report actual issues. DO NOT report things that are not implemented yet. If there is no authentication, don't report as an issue.

Report findings grouped by severity (critical, high, medium, low) with file paths, line numbers, and suggested fixes.

The .env file is in the .gitignore. You always seem to report that it is not. Be aware of that.
```

#### Tools

Next it will ask about which tools it should use. Since this is a code scanner, we want to select **Read Only Tools**. It should not modify code in any way.

#### Model

For the model I will select **Opus**, which is the most advanced model right now.

Enter through the rest.

Now you should have a file at `/.claude/agents/code-scanner.md` which we can run simply by telling Claude to run it. It will use a separate context window as well.

You can edit this file however you want. You also do not have to use the `/agent` command. You could have just created the file manually.

We will try it in the next lesson.
