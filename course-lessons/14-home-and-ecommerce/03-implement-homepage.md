# Implement Homepage

Now we are ready to take the HTML/CSS prototype that we created and turn it into our React site homepage.

You can do this a few ways. You can do one section at a time or the entire thing.

I am going to do it in one go. It is all just presentational and we have the design, so there is not much to screw up.

## Homepage Prompt

This is simple enough where I don't think we need a spec document. Let's run the following prompt:

```text
/feature load Take the HTML/CSS in the prototypes folder and make this the landing page at /. Be sure to break it up into server components. Use client for anything that needs it. Make sure the code is clean, broken up and DRY. Be sure to use the svg logo in the nav and use the favicon.ico for the favicon.
```

After it is done, check over the actual site and see if it looks right. Then you can take a look at the code generated. Make sure the sign in and get started buttons go to the right pages.

You can use the Playwright MCP for this as well. It may do it automatically.

It was a lot of code generated, so you may actually want to run the following:

```text
use the @code-scanner subagent to check all the code related to the homepage and look for issues and anything that could be cleaned up including component composition, magic numbers, unused code, etc
```

From here you can pick and choose what to work on.

Once you are done:

```test
/feature review
/feature complete
/clear
```
