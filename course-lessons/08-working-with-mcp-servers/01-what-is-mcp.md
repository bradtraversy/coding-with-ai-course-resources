# What Is MCP?

MCP stands for **Model Context Protocol**. It’s an open standard that allows AI models and AI-powered tools (like **Claude Code**, **Cursor**, etc.) to securely connect to external data and capabilities.

This includes things like:

- Local or remote files
- Databases and APIs
- Developer tools like Git and package managers
- Search engines and third-party services

In other words:

> **MCP gives AI controlled access to the real world**  
> so it can retrieve information and take useful actions.

<img src="../images/mcp-simple-diagram.avif" width="700" />

In the diagram, the AI tool (an IDE, a chat interface, or another app) communicates through MCP to things like a Postgres database, a Git repository, a Slack workspace, Google Maps — **anything that can expose a tool or resource provider**.

The flow is **bidirectional**:

- The AI can **read**: fetch context or data it needs
- The AI can **act**: create, modify, or trigger things in the outside world

This creates a foundation for truly useful AI-assisted development — not just text generation.

I like this analogy. You can think of MCP like a **USB port for AI applications**:

- USB standardizes how devices plug into a computer
- MCP standardizes how tools and AI models plug into external resources

To see a bunch of examples, you could go to https://cursor.directory/mcp

This is a directory geared toward Cursor users, but you can just as well use these MCPs with any AI tool that supports model context protocol.

Claude also has a listing in their docs at https://code.claude.com/docs/en/mcp.

I want to setup two MCPs in this section and that is Neon and Context7, which I'll talk about in the coming lessons.

## Local & Remote MCP

There are local and remote MCP servers. Which you use really depends on what you need it for. Remember, we're not actually using MCPs in our app where our users will use it. We're using it as a devtool with Claude Code or Cursor. So we can use local MCPs if they're available. For instance, you can install the Neon MCP either locally or remotely.

#### Local MCP

- Runs on your local machine via a Node.js or Python process
- Communicates using **stdio** (standard input/output)
- **Pros**: High privacy, works offline, full control with OS-level access
- **Cons**: Limited to your local machine, harder to share with web-based agents
- Best for individual developer tooling and needing quick, private access to local resources

#### Remote MCP:

- Runs on cloud servers (SaaS)
- Connects over **HTTP or WebSockets** with secure authentication (e.g., OAuth or API keys)
- **Pros**: Accessible from anywhere, no local setup, easy to share
- **Cons**: Relies on Internet, potential privacy concerns
- Best for web apps, enterprise use, collaborative environments

## MCP Setup

Depending on which AI tool you're using, the setup will be a little different. If you're using Cursor, you can actually click a button to install many MCP servers. For Claude, you can run Bash commands, but ultimately, its just creating a JSON file with the MCP server info.

## Scopes

In Claude Code, we actually have 3 different scopes for MCP servers:

1. Local Scope: Remain private to you and are only accessible when working in the projects path. Good for personal development servers, experimental configurations or servers containing sensitive credentials that shouldn’t be shared. They are stored in your root in a `/.claude.json` file.

2. Project Scope: Enable team collaboration by storing an `.mcp.json` in your project's root folder. This is designed to be checked into version control. This is the most common scope and what we will be doing.

3. User Scope: Provide cross project accessibility while remaining private to your user account. This is good when you use the same servers across multiple projects. This file goes in your home directory at `~/.claude.json`

## Commands

You can create the folders that I mentioned manually and add your MCP server info or you can run a command.

```bash
claude mcp add --transport http stripe https://mcp.stripe.com

# Explicitly specify local scope
claude mcp add --transport http stripe --scope local https://mcp.stripe.com
```

## MCP Tools & The Context Window

This is something that is very important. MCP servers are incredibly useful BUT there is a tradeoff. They can use quite a few tokens just to load. For instance, I think the Neon MCP takes like 20k tokens to load in or something like that. So if you don't plan on using them for a while, you may want to disconnect them. Its only a single command to connect and disconnect.

Next we will go ahead and setup the Neon MCP server.
