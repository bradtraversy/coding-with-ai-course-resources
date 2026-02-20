# Slash Commands

So Claude has a bunch of built-in slash commands that you can use for all kinds of stuff. I will use these throughout the course, but let's go over some of the simple common ones now.

Type a forward slash in the terminal and you'll see a list pop up. You'll only use a few of these day-to-day. You don't need to memorize all of these.

## /exit

We already know that `/exit` is used to exit the Claude session and interface.

## /login & /logout

`/login` is really only needed when you do your initial setup. This will let you select your Anthropic account in the browser and log you in. Otherwise, you'll just get a 500 response. Then `/logout` of course will log you out of Claude.

## /config

`/config` Will give you some tabs to cycle with tab.

The **Status** tab will show you the version, login method, location, model, etc

The **Config** tab is where you can specify certain things.

**Auto Compact**: Auto-compact is when Claude Code automatically compresses your conversation when you're running low on context space - you don't have to manually trigger it. I like to keep this off and run the `/compact` command manually if needed.
**Show tips** - Shows helpful tips and suggestions in the interface as you work.
**Rewind code** (checkpoints) - Enables the **/rewind** command which lets you go back to a previous point in the conversation and undo changes. Creates checkpoints as you go.
**Verbose output** - When true, shows more detailed output about what Claude is doing behind the scenes. Useful for debugging, but can be noisy.
**Default permission mode** - Controls how Claude asks for permission to edit files. "Default" means it asks each time. You can set it to be more or less permissive.
**Respect .gitignore in file picker** - When true, Claude won't show or suggest files that are in your .gitignore (like node_modules, .env files, etc.).
**Theme** - Dark mode or light mode for the interface.
**Notifications** - Controls system notifications. "Auto" means it decides based on context.
**Output style** - How Claude formats its responses. "Default" is standard, but you can change it to be more concise or detailed.
**Editor mode** - "Normal" is standard. There's also a vim mode if you're into that.
**Model** - Which Claude model to use. "Default (recommended)" lets Claude Code pick the best one automatically.
**Auto-connect to IDE (external terminal)** - When true, Claude Code running in an external terminal will automatically connect to your IDE (like VS Code).

I usually leave all of these on the defaults.

The **Usage** tab shows your current session usage as well as your weekly usage.

## /help

This will give you 3 tabs to cycle. General, commands and Custom Commands.

General shows you the shortcuts to do certain things. For instance, if you want to go into straight terminal mode, you can type exclamation. / for commands, @ for mentions and so on. We'll get into that stuff later.

The Commands tab will show you all the available built-in commands. Then you have the Custom Commands tab, which will show you the custom commands that you create, again, we'll get into that later as well.

Hit esc to exit.

## /model

This will show you which model you're using and let you select which one you want to use. Different AI coding tools give you different model options. Cursor lets you choose between GPT, Claude, and others. Claude Code uses Claude models.

- **Claude Sonnet** - Fast, good for quick tasks (200k context)
- **Claude Opus 4.5** - Most capable, best for complex work (200k context)
- **Claude Sonnet (1M)** - Extended context for large codebases
- **Claude Haiku** - Fast and cheap, but not as good as others

For this course, I recommend **Claude Opus 4.5** or **Sonnet**. I am not sure if Opus 4.5 is available with the Pro plan. It may only be for the $100 and $200 Max plans. If you do not have it, just use Sonnet. Opus is smarter but uses your quota faster. Sonnet is a good balance. If you're someone that doesn't clear your context often, you may want to use Sonnet 1M. If you pretty stick to a session for a feature, then I suggest Opus 4.5, which is what I'll be doing.

If you're using a different tool like Cursor, use whatever the most capable model available is - usually GPT-4o or Claude Sonnet/Opus.

## /output-style

This is really cool for people learning something. The default is efficient and concise, but if you want things to be explained better, there's an explanatory mode and even a learning mode where it will ask you to write small pieces of code for hands on practice, which is great.

## /todos

This will list out the current todos for the task that Claude is trying to complete.

## /doctor

This is just a health check for Claude. It checks things like:

- Is Claude Code installed correctly?
- Is your authentication valid?
- Are there any configuration issues?
- Is your Node.js version compatible?
- Can it connect to Anthropic's servers?

## /export

This will export your conversation to a file or to the clipboard. Go ahead and try it.

## /feedback

Send feedback to Anthropic

There are some other really important commands that have to do with context and sessions, but I want to look at those a little later.

## `think` and `think harder`

There is something else I want to mention here that is not a slash command, but a keyword and that is **think** and **think harder**.

These can be used in your prompt to get extended thinking. Claude takes more time to think through complex problems. This is useful when it's stuck on something and you're running in circles. I'm sure we will use it somewhere along the way.

You simply use it like this:

```text
think through why this auth redirect isn't working

or

think harder about the best way to structure this
```
## Settings & Permissions

Claude uses a settings file that can be scoped 3 different ways using 3 different files.

#### Personal Project Scope

This is where the settings is gitignored. It will only be for your user in your project.

File: `<PROJECTFOLDER>/.claude/settings.local.json`

#### Project Scoped

This is where the settings file is checked into Git and applies to all users.

File: `<PROJECTFOLDER>/.claude/settings.json`

#### User Global Scoped

This is where the settings apply across all projects for your user.

File: `~/.claude/settings.json`

The most common is to have project scoped where it applies to one project for all team members.

You can have both local and project files but if there is the same thing in both files, the `settings.local.json` will be priority.

## What goes in a settings file?

The settings file can have things like:

- Permissions
- MCP Server Settings
- Hooks (Automated bash scripts)
- Model Preferences
- API Config
- Disabled Tools

Things will get added to our settings file as we move along.
