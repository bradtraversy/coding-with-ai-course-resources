# Neon MCP Setup

I want to setup Neon's MCP server so our AI has direct live access to our database.

Right now, if we want to check something in our database, Claude Code or whatever tool you're using will run a script, commands, check Prisma Studio and other kind of third party options. I want it to be able to directly connect and query our Neon database. So the Neon MCP is a nice addition.

There are actually individual guides for a bunch of clients that you can see here - https://neon.com/docs/ai/connect-mcp-clients-to-neon. So if you're using any of these, click on the client you are using. I will go to the Claude Code url, which is https://neon.com/docs/ai/connect-mcp-clients-to-neon#claude-code.

We are going to use the remote MCP, so let's open a terminal. I would suggest opening a regular terminal outside of VS Code.

```bash
claude mcp add --scope project --transport http neon https://mcp.neon.tech/mcp
```

You can also use an api key with scoped projects, which is what I would rather do, however there is a known bug right now that won't let it reconnect with Neon after it authenticates.

Now run:

```bash
claude mcp list
```

You should see the Neon MCP but it will say "Needs authentication"

Run `claude` in that same terminal:

and type this in the prompt:

```
/mcp
```

It will then allow you to authenticate. Click "enter" to login. Click "Authenticate" and a browser will open for your to verify.

Now you can go back to your Claude Code tab and type `/mcp` and you should see Neon-Authenticated.

## Files

Since we installed on the project scope, you should have a `.mcp.json` file in your project root with the following:

```json
{
  "mcpServers": {
    "neon": {
      "type": "http",
      "url": "https://mcp.neon.tech/mcp"
    }
  }
}
```

You can now work with your Neon database with natural language.

Restart Claude and go ahead and prompt:

```text
Show me the users in my Neon database development branch
```

**Note:** When we have an MCP do something, it will ask to run certain tools that give Claude and other clients special abilities. These are functions that the MCP exposes to Claude. When you install an MCP server, it registers tools that Claude or whatever you are using can call.

Sometimes it will come back with the production branch. If it does, tell it again to use the development branch.

What I would suggest is adding this to your `CLAUDE.md` so it always knows.

You can say:

```text
Give me instructions to put in my CLAUDE.md file so that you always know to use the development branch of the devstash project/database. We NEVER want to touch production data unless I specify it.
```

It will probably give you something like this:

```markdown
## Neon Database

- Project: `devstash-dev` (ID: `misty-star-52921858`)
- **Always use the development branch** (`br-holy-surf-ahiogq48`) for all database operations
- Production branch (`br-polished-fire-ah6vrbme`) is OFF LIMITS unless explicitly requested
- When running queries, migrations, or any database operations, always pass the development branch ID
```

Now run this prompt:

```text
Show me the collections table data
```

It should work right away.

That's it now we have the Neon MCP set up.
