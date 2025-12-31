# Forgot Password

We have working authentication and email verification. If this were a real SaaS, you need a forgot password action. If you want to skip this and move on, that's fine too.

We already have a token system in place for email verification so we can use that.

I will run the following to add a new feature:

```text
/feature load create a forgot password link and functionality. Use existing VerificationToken model for password reset tokens
```

Run

```text
/feature start
```

It will create the feature for us. You can go over the specifications and make sure they look good.
