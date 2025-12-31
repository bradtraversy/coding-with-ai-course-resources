# UI Reviewer Subagent

Since we now have a landing page, we should start to think about the UI/UX of the project.

Since I started building SaaS projects, I have learned that how things are presented is so much more important than I used to think it was. I used to only think about how good the product was, but if you have a crappy UI/UX, nobody is going to get to your product to try it.

This definitely is not a UI/UX course and I couldn't teach that stuff if I wanted to. But what we can do is create a subagent to look over this stuff for us.

Let's create a new file at `.claude/subagents/ui-reviewer.md`. You can find this file in the course files and add the content from it.

## Use The UI Reviewer Subagent

I would suggest restarting your Claude Code instance. Then run the following prompt:

```text
Use the @ui-reviewer subagent to check the websites user interface and give feedback
```

You will probably get some minor issues like missing aria attributes. Fix what you think is necessary.

Once you are happy, commit and push the changes.
