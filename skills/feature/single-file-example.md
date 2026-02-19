---
name: feature
description: Manage current feature workflow - start, review, explain or complete
argument-hint: load|start|review|explain|complete
---

## Context

Read the current feature from:
@context/current-feature.md

## File Structure

current-feature.md has these sections:

- `# Current Feature` - H1 heading with feature name when active
- `## Status` - Not Started | In Progress | Complete
- `## Goals` - Bullet points of what success looks like
- `## Notes` - Additional context, constraints, or details from spec
- `## History` - Completed features (append only)

## Task

Execute the requested action: $ARGUMENTS

---

### If action is "load":

1. Check $ARGUMENTS (after "load"):
   - If it looks like a filename (single word, no spaces): Look for `context/features/{name}.md`
   - If it's multiple words: Use as inline feature description, generate goals
   - If empty: Error - "load" requires a spec filename or feature description
2. Update current-feature.md:
   - Update H1 heading to include feature name (e.g., `# Current Feature: Add Navbar`)
   - Write goals as bullet points under ## Goals
   - Write any additional notes/context under ## Notes
   - Set Status to "Not Started"
3. Confirm spec loaded and show the feature summary

---

### If action is "start":

1. Read current-feature.md - verify Goals are populated
2. If empty, error: "Run /feature load first"
3. Set Status to "In Progress"
4. Create and checkout the feature branch (derive name from H1 heading)
5. List the goals, then implement them one by one

---

### If action is "review":

1. Read current-feature.md to understand the goals
2. Review all code changes made for this feature
3. Check for:
   - ✅ Goals met
   - ❌ Goals missing or incomplete
   - ⚠️ Code quality issues or bugs
   - 🚫 Scope creep (code beyond goals)
4. Final verdict: Ready to complete or needs changes

---

### If action is "explain":

1. Read current-feature.md to understand what was implemented
2. Run `git diff main --name-only` to get list of files changed
3. For each file created or modified:
   - Show the file path
   - Give a 1-2 sentence explanation of what it does / what changed
   - Highlight any key functions, components, or patterns used
4. End with a brief summary of how the pieces fit together

Output format:

## Files Changed

**path/to/file.ts** (new)
Brief explanation of what this file does and why it was added.

**path/to/other.ts** (modified)
What changed and why.

## How It All Connects

Brief summary of the data/control flow between these files.

---

### If action is "complete":

1. Run a final review to ensure everything is complete
2. Stage all changes
3. Commit with a descriptive message based on the feature
4. Push the branch to origin
5. Merge into main
6. Switch back to main branch
7. Reset current-feature.md:
   - Change H1 back to `# Current Feature`
   - Clear Goals and Notes sections
   - Set Status to "Not Started"
8. Add feature summary to the END of History

---

If no action provided, explain the available options: load, start, review, complete