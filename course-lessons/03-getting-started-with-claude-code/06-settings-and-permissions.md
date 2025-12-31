# Settings & Permissions

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

When claude runs a tool like Read, Bash, Write, etc, and it asks if you want to allow it, it will add it to the allow list in your settings file.

Now if you get a `settings.local.json` file created and you don't want that and you want a project-scoped settings file, just change it to `settings.json`. That's what I am going to do.

## Permissions

If you want to add a permission allow or deny for certain tools, you can do so with the `/permission` command.

Go ahead and try and add the **Read** command to the allow list.

We will work more with the settings file as we move on.
