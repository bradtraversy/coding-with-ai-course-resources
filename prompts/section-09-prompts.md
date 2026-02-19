# Section 9 Prompts

## Email Verification Feature Prompt

```text
/feature load Setup email verification on register. Users need to click on the link in their email. We are using Resend. The RESEND_API_KEY is in the .env file. Use onboarding@resend.dev as the from email for now.
```


```text
Create a script in the scripts folder to delete all users and their content except the default demo@devstash.io email and content
```

## Verification Flag Prompt 
```text
/feature load Add a flag that can easlity be changed to enable and disable email verification. Right now, we have no domain linked to Resend, so only the Resend email can be registered. I want to be able to disable it. We can use an env variable but I am open to other options
```

## Forgot Password Prompt
```text
/feature load create a forgot password link and functionality. Use existing VerificationToken model for password reset tokens
```

## Auth Audit Subagent Prompt

```text
I just added authentication with NextAuth v5 including:
- Credentials and GitHub providers
- Email verification flow
- Forgot password / password reset flow
- Profile page

Create a subagent file at `.claude/agents/auth-auditor.md` that audits all auth-related code for security issues.

The agent should:
1. Focus on areas NextAuth does NOT handle automatically (password hashing, rate limiting, token security)
2. Check the email verification flow for secure token generation and expiration
3. Check the password reset flow for token security, expiration, and single-use enforcement
4. Check the profile page for proper session validation and safe update patterns
5. NOT flag things NextAuth already handles (CSRF, cookie flags, OAuth state)
6. Write findings to docs/audit-results/AUTH_SECURITY_REVIEW.md (create the folder if it does not exist) with severity levels and specific fixes. Add the last audit date and rewrite this file when the subagent is used.
7. Include a "Passed Checks" section to reinforce what was done correctly
8. Your audits always give false positives, so MAKE SURE you only report actual issues. Use web search if you are unsure of something.

Use Glob, Grep, Read, and Write tools. Use sonnet model.
```