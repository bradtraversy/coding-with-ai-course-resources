# What Are Custom Commands?

So we've been creating our application with Claude Code and if you're using something else, that's fine. Now I want to customize our workflow even more by creating custom commands.

Commands are reusable prompts that you can invoke with:

```text
/<command-name> [arguments]
```

## Why Create Custom Commands?

The biggest reason to use custom commands is to save time on repetitive tasks and standardize a workflow across a project or team.

## Where They Live

**Project-Based Commands**
When you create a custom command, it goes in the `.claude/commands` folder. That is a project specific command.

**Personal Commands**
You can also create a global command across all your projects by adding it to `~/.claude/commands`

## Namespacing

You organize commands in subdirectories.

## Basic Structure

The basic structure of a command file is simple:

```markdown
---
description:
---

Your prompt goes here
```

## Creating A Basic Command

Just to get the hang of it, let's create a basic that will list the component files of our project with a description that can take an optional argument of a specific subdirectory.

Create a file at `/.claude/commands/list-components.md` and add the following:

```markdown
---
description: List project components
argument-hint: [subdirectory]
---

## Task

List all React component files (.tsx, .ts, .jsx, .js) in the components folder.

If a [subdirectory] is provided via $ARGUMENTS, only list files in that subdirectory.

## Output Format

- Numbered list of files with relative paths
- Brief one-line description of each (infer from filename)
- Summary count at the end

If no files found, say "No components found."
```

You will have to re-open your Claude terminal or tab for it to show up. So do that and then type:

```text
/list-components
```

You should get a nice formatted list

You can pass in an argument like this:

```text
/list-components ui
```

It will show you all the components within the **/components/ui** folder.

You can delete or keep this command, it's up to you. I'll just go ahead and keep it and commit it to the repo.
