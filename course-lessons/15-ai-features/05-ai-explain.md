# AI Explain Feature

Now we need to add the feature to have AI look at our snippets, etc and explain the code. I want to have a button in the drawer for this.

I attached a new feature spec called `ai-explain-spec.` this has all the requirements that we need. So let's run this with the /feature command:

```
/feature load ai-explain-spec.md

/feature start
```

Test manually to see if the explainer works with both snippets and command types. You should have a button and tab that shows the explanation. It can take a few seconds for the AI to give a response. That is normal.

Then you can run your unit tests:

```text
/feature test
/feature review
```

If all is well, then complete and clear context:

```text
/feature complete
clear
```
