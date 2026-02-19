# Cleanup Command

I usually like to have a command to do simple clean up tasks like look for files to break into smaller files, make sure the history in the current feature file is in order and just about any other small clean up task you can think of.

Let's create a new file at `.claude/commands/cleanup.md` and add the following:

```markdown
---
description: Clean up project housekeeping tasks (add "run" to execute fixes)
---

Review the codebase for cleanup tasks:

1. Make sure that the history in @context/current-feature.md is in order from oldest to newest
2. Find unnecessary console.log statements in src/
3. Find unused imports
4. Check for stale TODO comments
5. Find orphaned/unused files
6. Check that context files match actual project state
7. Make sure that .env.production values are up to date with the same values as .env except for database values. Make sure those are different
8. Find `@ts-ignore` comments that might be stale

**Mode: $ARGUMENTS**

If no argument or argument is "check":

- Only report findings, don't modify anything
- List what WOULD be cleaned up

If the argument is "run" or "fix":

- First, report all findings with numbered items
- Then ask: "Which items would you like me to fix? (enter numbers like 1,3,5 or 'all' or 'none')"
- Wait for user response before making any changes
- Only fix the items the user specifies
- Report what you changed
```

So now you can run the command `/cleanup`. It will report the issues and ask what you want to fix if anything. Go ahead and try it.
