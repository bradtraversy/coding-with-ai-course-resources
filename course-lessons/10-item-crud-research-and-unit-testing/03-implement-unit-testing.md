# Implement Unit Testing

I wanted to introduce unit testing at some point. Right now, we manually test and we run `npm run build`, but I want to add another level and use Vitest. I don't want to go crazy with testing so we'll stick to the actions and utility functions. I don't want to get into React Testing Library.

This will change our workflow slightly where we will also run unit tests in addition to manual testing.

You can run this as a feature or just manually add the prompt:

```text
Set up Vitest for unit testing. We only want to test server actions and utilities, not components.
Update the workflow in @context/ai-interaction and any other docs where you see fit if needed.
```

It will install and configure Vitest to test actions and utilities. It will create a sample test and run it.

You can tell it to test specific functions, but it will also automatically create tests where there is testable logic and it makes sense.

## Add Testing To The /feature command

Instead of manually telling the AI to test or depending on context files that don't always work, let's add an additional argument to our `/feature` command to test any new actions or utilities.

Open the `/.claude/commands/feature.md` file and add the following:

Add "test" here om the description and the hint:

```markdown
---
description: Manage current feature workflow - start, review, test or complete
argument-hint: start|review|test|complete
---
```

Add this before the **review** case:

```markdown
---

### If action is "test":

1. Read current-feature.md to understand what was implemented
2. Identify server actions and utility functions added/modified for this feature
3. Check if tests already exist for these functions
4. For functions without tests that have testable logic, write unit tests for:
   - Create unit tests using Vitest
   - Focus on server actions and utilities (not components)
   - Test happy path and error cases
   - Do not write tests just to write them. Use your best judgement to see if it is useful
5. Run `npm test` to verify all tests pass
6. Report test coverage for the new feature code

---
```

Add this to the **review** bullet points:

```markdown
- 🧪 Adequate test coverage for new code
```

Add "test" at the bottom:

```markdown
If no action provided, explain the available options: start, review, test, complete
```

We will now make this part of the feature workflow.
