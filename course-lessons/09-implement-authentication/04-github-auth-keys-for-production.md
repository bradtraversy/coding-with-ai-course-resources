# Github Auth Keys For Production

We need to add our Github keys to our production app. However, when creating the keys, it can only have one callback. Ours uses localhost for dev, so that means we need to create a new Github OAuth app for production and have the correct callback URL with the Vercel domain.

Go to https://github.com/settings/developers and create a new OAuth app. Add the following to the callback:

```
http://YOUR_VERCEL_DOMAIN/api/auth/callback/github
```

Now add the environment variables to the `.env.production` file:

```
AUTH_GITHUB_ID="xxxx"
AUTH_GITHUB_SECRET="xxxx"
```

This file is just for your reference.

## Add To Vercel

You also need to add these to your Vercel deployment. Go to **Settings->Environment Variables** and add both. Redeploy if asked.

