# Implement Homepage

Now we are ready to take the HTML/CSS prototype that we created and turn it into our React site homepage.

You can do this a few ways. You can do one section at a time or the entire thing.

I am going to do it in one go. It is all just presentational and we have the design, so there is not much to screw up.

## Create the Homepage Spec File

Usually I give you the spec file, but I want to hav you create your own this time. Especially since you may have a much different mockup. Let's run the following prompt:

```text
Create a spec file at @context/features called homepage-spec.md to take the mockup in the @prototypes/homepage folder and create the actual app homepage from it. Here are some guidelines to add in the spec: 

- Page broken up into server components and client components where needed for interactivity
- Use Tailwind/ShadCN like the rest of the project
- Keep code clean and dry
- Make buttons and links go to the correct places

Look at the spec files in the @context/features folder for reference. Keep it concise but complete
```

After it is created, run the following:

```
/feature load homepage-spec.md
```

Go through the workflow:

```
/feature start
/feature review
/feature complete
/clear
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
