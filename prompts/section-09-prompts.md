# Section 8 Prompts

## Email Validation Feature

```text
/feature load Setup email verification on register. Users need to click on the link in their email. We are using Resend. The RESEND_API_KEY is in the .env file.
```

## Delete Users Script Prompt

```text
Create a script in the scripts folder to delete all users so that we can test auth in development
```

## Github Email Link

```text
If a user registers with an email that is also their Github email, they should be able to log in with either method
```

## Bypass Email Confirmation Prompt

```dev
Bypass the email confirmation only for local development
```

## Security Code Scan Prompt

```text
We just added authentication. Have the code-scanner subagent scan for possible security issues.
```

## User Access Control Prompt

```text
/feature load Implement proper user-scoped data access so users only see and modify their own data.

All data queries must filter by the authenticated user's ID

Verify the user owns the resource before modifying
```

```text
/feature load create a forgot password link and functionality. Use existing VerificationToken model for password reset tokens
```
