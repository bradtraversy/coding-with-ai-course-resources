# AI Auto Tagging

We are going to add an AI auto tagging feature. When we add or edit a new item, we want to have a "Suggest Tags" button, which will use the AI model to create tags for us.

## Update Current Feature

We could create a feature spec file for this, but I think it is easy enough where we can just type out what we want with the **/feature** command.

Let's run the following prompt:

```text
/feature load Implement AI auto-tagging for items using OpenAI GPT-4o Mini. Install OpenAI SDK, create src/lib/openai.ts with lazy client initialization, add generateAutoTags server action with Pro user gating, add Suggest Tags button to item create/edit forms, show tag suggestions with accept/reject UI, include loading states and error handling.
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
