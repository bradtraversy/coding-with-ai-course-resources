# Populate Dashboard Collections

Now that we have some data in the database, let's start to populate the dashboard with actual data instead of the hardcoded dummy data.

We will start with the collections in the main area.

## Document The Feature

Let's run this prompt to create the feature:

```text
Add a new feature to the @context/current-feature.md file. Use the feature specs from @context/features/dashboard-collections-spec.md
```

## Implement The Feature

```text
Create a new branch and implement the feature in the @context/current-feature.md file
```

## Test It

Make sure the structure looks good and test in the browser. You should see the actual database data including the stats.

If all looks good, run the following prompt:

```text
Mark this feature as completed then commit, merge and push
```

Hopefully, you get the hang of the workflow now. It's up to you on how much you want to examine the code. The more the better. If this were not a course, I would probably go through the specific code a bit more, but the main focus here is AI workflow. The most important thing is that you understand the architecture.
