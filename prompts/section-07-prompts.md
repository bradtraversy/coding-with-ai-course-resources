# Section 7 Prompts

## Subagent Prompt

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

## Add Quick Wins As A Feature

```text
Add a new feature to @context/current-feature.md with any quick wins from the list, meaning little to no risk. I want the N+1 issue. Authentication has not been implmeneted yet so do not add that.
```

