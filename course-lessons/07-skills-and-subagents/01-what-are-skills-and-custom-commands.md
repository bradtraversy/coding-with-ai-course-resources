# What Are Skills & Custom Commands?

Now we are going to start to get a bit more into Claude Code by adding skills, custom commands and subagents. I know you may be using something else and that's ok. If you're using Cursor or Codex or something similar, they all have something comparable, they may just be called something else and there is obviously a different set of steps to set it up. What I suggest is watching what I do and then just ask ChatGPT how to do the same thing with your tool.

## Custom Slash Commands vs Skills

We know what slash commands are. We have been using commands like `/context` and `/clear`. You can also have custom slash commands. Things move very fast in the world of AI and just since I started creating this course, there has been a big change in Claude Code. Custom slash commands have been merged into something called skills. A lot of people have a hard time explaining and understanding the difference. An easy way to put it is that custom slash commands are executable by you the user and skills are executable by the agent as well as you the user. Before, skills were only executed by the ai and not you directly. They have changed that, so now all custom commands can be skills.

The only difference in how we create a custom command and a skill is the location of the file. Before, we would have it in `.claude/commands/command-name.md` and now it is `.claude/skills/[skill-name]/SKILL.md`. You can still use the command folder, but I would suggest using the newer structure since the command folder may be deprecated at some point. I will show you both ways.

## Creating A Slash Command

Once you add your skill or command file, you can invoke them like this:

```text
/<command-name> [arguments]
```

## Why Create Custom Commands?

The biggest reason to use custom commands is to save time on repetitive tasks and standardize a workflow across a project or team.

## Where They Live

**Project-Based**
When you create a custom command or skill, it goes in the `.claude/commands` or `.claude/skills` folder. That is a project specific command.

**User-Based**
You can also create a global command across all your projects by adding it to `~/.claude/commands` or `~/.claude/skills`


## Basic Structure

The basic structure of a command file is simple:

```markdown
---
name (SKILL ONLY):
description:
---

Your prompt goes here
```

Everything in the dashes is called frontmatter. It is meta data associated with your command or skill. The only thing that is required is a description for both commands and skills and then a name is also required for skills. There are a lot of other things you can add like argument hints, whether or not the agent can invoke it, etc.

## Creating A Basic Command

Just to get the hang of it, let's create a basic that will list the component files of our project with a description that can take an optional argument of a specific subdirectory. I will first use the command file structure and then move it to the newer skill structure. It will work the same way.

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

## Skill Folder

Again, I would suggest using it as a skill. So rename the `commands` folder to `skills` and then create a folder called `/list-components`. Move the `list-components.md` file into it and rename the file to `SKILL.md`. Try it in Claude and it should work the same way.

