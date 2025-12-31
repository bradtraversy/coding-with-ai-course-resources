# Install Context7

The next MCP server that I want to work with is called Context7. This is an MCP that gives your client access to the latest docs for a bunch of popular technologies. When using LLMs, they have a cutoff date. So if there is something new released, a lot of the time, the LLM won't pick it up. So using Context7 gives it access to the latest changes. We mainly need this for Prisma and Next Auth.

If you go to https://context7.com/ you can see the types of documentation available.

We need an API Key now when we install, so you can just login with Github or Google and then click on the "Create API Key" button. Give it a name and generate. Copy it and put it somewhere because you won't see it again.

Now where it says "Connect", click on your client. I will click on Claude Code and it shows the command to run, however I want to install in the project scope. So we will run the following:

```bash
claude mcp add --scope project --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY:ctx7sk-ddad7534-2f0c-421e-9088-e091999adeca"
```

If you are on Windows, you may have issues with the slash, so you can remove that like I did above.

Run that and then type:

```bash
claude mcp list
```

You should see the Context7 and Neon MCP servers.

It will also be added to your `.mcp.json` file.

You can test by running the following prompt:

```text
Spawn a subagent to use context7 to look up what's new in Prisma 7, specifically new features and breaking changes from v6
```

It will run specific tools to do so and then give you a summary of the changes. So now our agent has superpowers and knows all the latest docs for many different technologies.

Let's commit what we have:

```text
Commit the changes made and push to main
```
