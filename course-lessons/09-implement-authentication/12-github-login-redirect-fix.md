# GitHub Login Redirect Fix

I ran into a small issue with the GitHub login. I would click the GitHub button once and it would just refresh and not redirect me to the dashboard. 

After some research, I found the `signIn` function we used with OAuth is not reliable for redirects with v5. The solution is to instead, use the `signIn` from `@/auth` in a server action.

I put the fix in the course files in `context/fixes/github-oauth-redirect-fix.md`. Move that to either your context `/features` or `/fixes` and then run the following prompt:

```
/feature load github-oauth-redirect-fix.md
```

Go through the motions and test in both dev and prod. Then `/feature complete`