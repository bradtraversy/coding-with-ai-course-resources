# Playwright MCP Setup

The next MCP tool that I want to install is Playwright. Playwright is an open-source automation library that for end-to-end testing and can simulate real users.

The reason that I want to use it is because it allows Claude or whatever AI tool you're using to see the browser. Now you can take screenshots and have it look at those, but that can be kind of a pain. So I want to be able to just have Claude see the UI when we need it to.

## Install PlayWright

If you go to https://github.com/microsoft/playwright-mcp you will see a list of clients to chose from. The Claude Code command on the project scope is:

```bash
claude mcp add playwright --scope project npx @playwright/mcp@latest
```

Go ahead and run that in your terminal.

Make sure it was installed with `claude mcp list`.

If you go into Claude and type `/mcp` you can select the Playwright option and then "View Tools" and you will be able to see all the cool things it can do.

Restart Claude or whatever tool you are using and enter the following prompt:

```text
Open a browser and tell me what the hero section of traversymedia.com says
```

It will ask to run the needed tool and it should show you.

Now Claude can use the browser. How frigging cool is that? 😉
