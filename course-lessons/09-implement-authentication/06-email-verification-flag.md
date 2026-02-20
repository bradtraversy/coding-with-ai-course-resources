# Email Verification Flag

We did our email verification for registration in the last video. It works well, but the problem is, when you do not have  a domain hooked up with Resend, you can only test with a single user email. The one you registered with Resend. If you try and register with a different email, you will get an error.

Let's create a flag to easily disable the verification feature.

I will run the following feature prompt:

```text
/feature load Add a flag that can easily be changed to enable and disable email verification. Right now, we have no domain linked to Resend, so only the Resend email can be registered. I want to be able to disable it. We can use an env variable but I am open to other options
```

See what it says as far as options and then run `/feature start`

Add the following to your `.env` file:

```
SKIP_EMAIL_VERIFICATION="true"
```

Once it is implemented, try and register a new user that is NOT your main Resend user and it should work. 

Then once you add a domain to Resend, you can change the from email from the onboarding@resend.dev to your own and set that variable to false and you should be all set.