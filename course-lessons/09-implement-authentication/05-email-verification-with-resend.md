# Email Verification With Resend

So we have basic authentication with Next Auth. One part of the auth process that is essential for production apps is email verification. You don't want people able to create 100 accounts with different email accounts they don't own.

## Resend API

We are going to use an email sending API called Resend. This is easier to setup than using SMTP directly and it's much less likely to hit spam folders. You also get analytics and other features.

Register and login to https://resend.com/ and it is important to register with the email that you will be testing verification with for your site. Because before you set a domain, it will still let you test locally, but it needs to be with the email you register with Resend. For instance, I use traversymedia@gmail.com for Resend, so that is the email I will test with for verification.

## API Key

Go to "API Keys". Click the "Create API Key" button. Give it a name and save. Show the key. You will only see it once, so make sure you copy it.

Then paste it in your `.env` like this:

```
RESEND_API_KEY="YOURKEY"
```

We also should add:

```
AUTH_URL="http://localhost:3000"
```

And then your production domain in the production variables.

When we are local only, it will use the email "onboarding@resend.dev" for sending to the email you registered with. Then later, you would setup a domain to send from.

## Add The Feature

Let's instruct the AI to setup verification. I will use inline text for this feature:

```text
/feature load Setup email verification on register. Users need to click on the link in their email. We are using Resend. The RESEND_API_KEY is in the .env file. Use onboarding@resend.dev as the from email for now.
```

Check the file and then run:

```text
/feature start
```

## Delete Users Script

I like to create a script to reset all users in dev. You don't have to do this but it makes it easy to test auth without creating a bunch of users.

Run the following prompt:

```text
Create a script in the scripts folder to delete all users and their content except the default demo@devstash.io email and content
```

Then run the script and register a new user and see if you get an email. Click on the link and you should get verified and be able to log in.


## Review & Complete

Alright, everything is working. Let's check our context and run a feature review:

```text
/feature review
```

If no issues, run:

```text
/feature complete
```

We now have full authentication with email verification.
