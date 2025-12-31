# User Access Control & Code Scan

We need to make it so that users only see their own data.

Let's run the following prompt:

```text
/feature load Implement proper user-scoped data access so users only see and modify their own data.

All data queries must filter by the authenticated user's ID

Verify the user owns the resource before modifying
```

Then run `/feature start`

Go through the workflow and iterate if needed.

Once done, `/feature review` and `/feature complete`.

## Code Scan For Security Issues

Implementing authentication can result in security issues. Let's clear our context and run the code scanner:

```text
We just added authentication. Have the code-scanner subagent scan for possible security issues.
```

Be aware that you will probably get false flags. For instance, I got one saying that my env values were exposed. Once I asked to look into it, it told me it was a false flag and my .env was always in the .gitignore.

If you have any severe issues, they should be addressed.
