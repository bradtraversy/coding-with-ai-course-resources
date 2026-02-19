# Feature Command Actions

So right now, we are using this workflow with our AI:

<img src="../images/ai-workflow.png" width="700" />

I want to add a new command so we don't have to manually load, start and complete a feature. I also want an argument to explain and also to do a review of the current feature code. 

You can see the new commands we can run instead of manual prompting for everything.

This is what I want to happen:

1. `/feature load [spec-file.md]` or `feature load a manual prompt` - This will either take a spec file from the **/context/features/** folder or a custom prompt (shorter descriptions) and load it into the **current-feature.md**.
2. `/feature start` - This will implement what is in the **current-feature.md** file. It will create a new branch, create the code for us. After that we will test and iterate.
3. `/feature review` - This will go over all of the code that was created for that feature and make sure that it is correct and did exactly what we want.
4. `/feature explain` - This will list files that were created or changed and explain the code. This is essential to going against vibe coding and understanding what is being done.
5. `/feature complete` - This will mark the feature as complete in the file, merge to main and delete the feature branch.

So this gives us a very smooth workflow that our entire team could use.

