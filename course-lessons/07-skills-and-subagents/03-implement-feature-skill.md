# Implement Feature Skill


Custom commands and skills are simply just markdown files. Originally, we added custom slash commands to the `.claude/commands` folder, but now that commands and skills have been merged, we add them to the `.claude/skills folder`.

You can find the files in your resource files for the course. 

Create a folder in your project at `.claude/skills/feature/SKILL.md`

This pertains to the `/feature` command.

We have a bunch of actions/arguments for this command. You have a few options. You can add everything to this file or you can have separate action files for each argument/task. I have included both versions in the resource files. I prefer to have the separate actions files. Copy the following to your project:

- SKILL.md
- actions/load.md
- actions/start.md
- actions/explain.md
- actions/review.md
- actions/complete.md

We will also have a test action but we will add that later.

In the next lesson, we will use and test the `/feature` command.