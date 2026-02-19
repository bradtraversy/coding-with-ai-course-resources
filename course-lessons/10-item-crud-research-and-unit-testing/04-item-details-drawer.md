# Item Details Drawer

I want this to be a snappy UI. We all know how impatient developers are. We want to click on a snippet and have it shoot open in a drawer rather than a separate page like a PHP site from 2012.

I don't care about the item display stuff like the code editor just yet. We will do that after our basic CRUD is done.

Let's load the feature spec:

```text
/feature load item-drawer-spec.md
```

After it is done, look over everything. If you are not happy with it, I would suggest using the Playwright MCP. 

For example, if you think it needs more padding, you could do the following:

```text
Login to /sign-in with  demo@devstash.io/12345678 and click on "Snippets" in the sidebar, then click on a snippet. Check the drawer and let me know if you have any suggested improvements. I think it needs more padding on the left.
```

Have it fix any issues, then run:

```text
/feature test
/feature review
/feature complete
```
