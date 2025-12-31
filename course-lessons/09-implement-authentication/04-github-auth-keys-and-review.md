# Github Auth Keys & Review

You should be able to log in with email/password. Now let's add our Github keys.

Go to https://github.com/settings/developers and click on **Oauth apps** on the left.

Click on "New Oauth App"

Fill in the following:

- App Name: Devstash (or something else)
- Homepage: http://localhost:3000
- Callback: http://localhost:3000/api/auth/callback/github

Copy the client ID and the client secret and add to your `.env` like this:

```
AUTH_GITHUB_ID="xxxx"
AUTH_GITHUB_SECRET="xxxx"
```

Restart the dev server

It should work now.

Let's clear and review:

```text
/clear
/feature review
/feature complete
```

## Create One For Production

You need to have the correct callback URL and that one is localhost.

Let's create another for production.

Go through the same process, but now use your Vercel domain. It will look like this:

- App Name: Devstash (or something else)
- Homepage: http://devstash.vercel.app
- Callback: http://devstash.vercel.app/api/auth/callback/github

Now add the environment variables to the `.env.production` file:

```
AUTH_GITHUB_ID="xxxx"
AUTH_GITHUB_SECRET="xxxx"
```

This file is just for your reference.

## Add To Vercel

You also need to add these to your Vercel deployment. Go to **Settings->Environment Variables** and add both. Redeploy if asked.
