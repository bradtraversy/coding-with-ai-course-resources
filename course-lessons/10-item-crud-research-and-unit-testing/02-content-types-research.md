# Content Types Research Command

Now we want to start building our content library. The snippets, notes, commands and so on.

Each item type has a different use and a specific entry in the "ItemType" table. What I want to do in this lesson is get a good idea of what the items for different types will look like going by the model we created.

I want to create a document that we can have Claude or whatever model you're using look at and figure out the different items look like so we can take steps to move forward for CRUD (Create/Read/Update/Delete). The reason being, there are a lot of different avenues we can take. I would also like to implement some unit testing with Vitest. We'll do that in a bit.

## `/research` Command

In case you haven't noticed, I like to be very structured and not run really long prompts. I rather have documentation and commands. Let's create a research command for anytime we want to research our own codebase and create some kind of documentation.

Create a new file at `.claude/commands/research.md`. You can get the file from the course files.

This will take in a prompt or a file located in `/context/research/`. So create that folder as well.

For our item content item research, create a file at `/context/research/content-planning.md`. Find the content for that file in the course files.

You may need to restart Claude Code to be able to run the new command.

Now we should be able to run the following:

```text
/research content-planning.md
```

This will generate a new file at `/docs/content-types.md` that can be used to create the CRUD architecture, which we will also document.

Take a look at the generated document and study it to get a good idea of what items from different types will look like.

Let's start to implement CRUD.
