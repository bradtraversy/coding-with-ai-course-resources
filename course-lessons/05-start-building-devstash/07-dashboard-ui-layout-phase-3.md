# Dashboard UI Layout - Phase 3

We want to start phase 3 of the dashboard, which will be the main area with the latest collections, pinned and recent items.

We want to stick to the workflow, which is documenting the feature in the `current-feature.md` file, then implmenting it, testing it, iterating, etc.


## Using Spec Files To Update The Current Feature

In your resource files, you will have `context/features/dashboard-phase-3-spec.md`. Put that into your project's `context/features` folder.

Now we can tell the AI to update the current feature based on that spec file.

Let's run the following prompt:

```text
Update the @context/current-feature.md to add the feature from @context/features/dashboard-phase-3-spec.md and set the status to In Progress
```

It will update the feature file. Now we can implement with the following prompt:

```text
Open a new feature branch and implement the feature in the @context/current-feature.md file
```

From here it will go through a bunch of steps and create multiple files.

Once it is done, you should have your sidebar setup.

Iterate as needed to get it looking how you want.

Once it is done and everything looks ok, you can run the  following:

```text
Set the current feature in @context/current-feature.md to completed, remove the info and add it to the history.
```

Then you can commit and merge:

```text
Commit to the feature branch, merge to main, delete the feature branch and push to remote
```

