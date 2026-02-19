# AI Auto Tagging

We are going to add an AI auto tagging feature. When we add or edit a new item, we want to have a "Suggest Tags" button, which will use the AI model to create tags for us.

## Spec File

Copy the course file at `context/features/ai-auto-tagging-spec.md` and run the following:

```text
/feature load ai-auto-tagging.md
```

We are asking for lazy client initialization because I don't want to load it unless it is being used. It avoids unnecessary overhead and potential errors for users who never touch the Pro features.

Let it do it's thing and report back. I would suggest running tests on the server action. Go ahead and run:

```text
/feature test
```

Once that is done, test it manually. If it does not work to your liking, iterate and fix.

Run a review and complete:

```text
/feature review
/feature complete
/clear
```
