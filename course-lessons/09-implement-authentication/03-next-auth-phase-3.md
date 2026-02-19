# Next Auth Phase 3

Now we will implement phase 2 which will be the email/password login and register using the credentials provider.

We have our user icon at the bottom left, but by default, the Next.js devserver adds the Next icon there which may be covering the user icon. Let's get rid of that logo.

In the `next.config.ts` file, add the following to the object:

```ts
const nextConfig = {
  devIndicators: false,
};
```

Then the Next logo should go away.

## Create The Feature

Run the following command:

```text
/feature load auth-phase-3-spec.md
```

This will add everything to the "current-feature.md" file.

Now run `/feature start`.

It will show the todos and handle them one by one.

You should now have your pages at `/sign-in` and `/register`. Try both to verify it works.

If everything works ok, run the following:

```text
/feature review
/feature complete
```

## Add Github Keys To Vercel

You need to add your 

```
AUTH_GITHUB_ID="xxxx"
AUTH_GITHUB_SECRET="xxxx"
```

This file is just for your reference.

We now have basic authentication. Let's start to add other features like email verification and forgot password.