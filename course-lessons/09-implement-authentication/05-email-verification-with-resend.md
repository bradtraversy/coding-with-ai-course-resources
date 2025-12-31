# Email Verification With Resend

So we have basic authentication with Next Auth. One part of the auth process that is essential for production apps is email verification. You don't want people able to create 100 accounts with different email accounts they don't own.

## Resend API Keys

I like to use a service called **Resend** for email verification. Usually, you would add a domain and test with that, but you can test locally if you use the email address you registered with Resend to test with. We can also add a bypass of email verification locally.

I am going to suggest that you use an email that you also have a Github account with. Because I want to make it so if the user registers with an email and password and they have a Github account with that email, they can also login with Github. This makes it easier to test.

Register and login to https://resend.com/ go to "API Keys". Click the "Create API Key" button. Give it a name and save. Show the key. You will only see it once, so make sure you copy it.

Then paste it in your `.env` like this:

```
RESEND_API_KEY="YOURKEY"
```

When we are local only, it will use the email "onboarding@resend.dev" for sending to the email you registered with. We can setup the domain later.

## Add The Feature

Let's instruct the AI to setup verification. I will use inline text for this feature:

```text
/feature load Setup email verification on register. Users need to click on the link in their email. We are using Resend. The RESEND_API_KEY is in the .env file.
```

Check the file and then run:

```text
/feature start
```

## Delete Users Script

I like to create a script to reset all users in dev. You don't have to do this but it makes it easy to test auth without creating a bunch of users.

Run the following prompt:

```text
Create a script in the scripts folder to delete all users so that we can test auth in development
```

Then run the script and register a new user and see if you get an email.

## Github Email Link

Right now if we register with an email that is connected to our Github account, it will probably give us issues. Let's run the following prompt:

```text
If a user registers with an email that is also their Github email, they should be able to log in with either method
```

Now try logging in with Github for that same email if possible.

## Bypass Confirm Email In Development

You will probably want to register other users locally at some point. So if you want you can run this prompt:

```dev
Bypass the email confirmation only for local development
```

## Review

Alright, everything is working. Let's check our context and run a feature review:

```text
/context
/feature review
```

If no issues, run:

```text
/feature complete
```

We now have full authentication with email verification.
