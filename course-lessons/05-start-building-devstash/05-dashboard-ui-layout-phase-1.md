# Dashboard UI Layout - Phase 1

We want to start to construct our dashboard but I want to do it in sections instead of doing it all at once. The first feature will be the following tasks:

1. ShadCN UI Init
2. Main Dashboard Route
3. Layout With Top Bar
4. Dark Mode Default

We want to stick to the workflow, which is documenting the feature in the `current-feature.md` file, then implmenting it, testing it, iterating, etc.


## Using Spec Files To Update The Current Feature

We could just manually prompt the AI to add the feature, but I like to use spec files, especially for larger features because it allows us to be more specific and you have a record of your prompts for those features.

In your resource files, you will have `context/features/dashboard-phase-1-spec.md`. Put that into your project's `context/features` folder.

Now we can tell the AI to update the current feature based on that spec file.

Let's run the following prompt:

```text
Update the @context/current-feature.md to add the feature from @context/features/dashboard-phase-1-spec.md and set the status to In Progress
```

It will update the feature file. Now we can implement with the following prompt:

```text
Open a new feature branch and implement the feature in the @context/current-feature.md file
```

From here it will go through a bunch of steps and create multiple files.

Once it is done, you should have ShadCN UI setup and the main dashboard layout at "/dashboard".

Once it is done and everything looks ok, you can run the  following:

```text
Set the current feature in @context/current-feature.md to completed, remove the info and add it to the history.
```

Then you can commit and merge:

```text
Commit to the feature branch, merge to main, delete the feature branch and push to remote
```
