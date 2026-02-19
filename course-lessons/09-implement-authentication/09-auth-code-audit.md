# Authentication Code Review

As I mentioned previously, when using AI to code, you should do frequent audits to make  sure everything is on track, there are no security issues and your code is clean.

We just added authentication, which is a really important part of any project, so this is a good time to look for issues. 

## Auth Auditor Agent

We could use our standard code-scanner, but I want to really focus on the authentication code, so I am going to add a custom subagent just for that. I also want the results to be documented. This is something I will do a lot so I have it for later. You may not want to implement all the optimizations right now. 

Instead of having you copy the subagent file, we are going to have Claude generate it for us.

Clear your context and add the prompt from your course files `prompts/section-09-prompts.md`.

It should create a new file at `/.claude/agents/auth-auditor.md`.

You can use it simply by prompting:

```
Do a code audit on all authentication-related files
```

It will automatically know to use the subagent and put the results in `docs/audit-results/AUTH_SECURITY_REVIEW.md`

When it gives you the results, take a look and use your own judgement on things that you want to fix.

It will mention rate limiting. We are going to do that next.

