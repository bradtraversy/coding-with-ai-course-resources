# Next Auth Phase 1

Ok so we still only have a basic dashboard. You probably thought since we're using AI and not writing code, we would have just blown through this. You could try that but I can almost guarantee you'd end up with a mess. I wanted to focus on workflow before we really went to town.

Now we want to implement one of the biggest features that we'll be adding and that is authentication. There are a few ways that you could do this. I think it is best to do in phases like we did the dash layout. So I have 3 spec files for you. You can download them in this lessons resources or you can get them from the course files. They are the following:

- context/features/auth-spec-files/auth-phase-1.md
- context/features/auth-spec-files/auth-phase-2.md
- context/features/auth-spec-files/auth-phase-2.md

I only put them in the "auth-spec-files" folder so you can find them easier. Move them directly into your project's "context/features/" folder

Take a look at the phase 1 file and go over it. There are things in these file that you probably will not understand unless you are very familiar with Next, Next Auth and Prisma and Neon serverless architecture. It is ok if you don't. Remember, you will be using this workflow with technologies you know more about.


I also want to mention that there's been changes to how we implement the prisma adapter with Next Auth. This is stuff that I've already researched. I added that stuff to the spec files.

To summarize, the way that the adapter interacts with Edge serverless architecture has changed.

## What is Edge?

If you are really interested in how this works, Edge is where your code runs geographically. Traditional servers run your code in one data center—say, Virginia. A user in Tokyo waits for the request to travel across the world and back. With Edge, your code runs on servers spread across the globe. The user in Tokyo hits a server in Tokyo. Faster response. The tradeoff: Edge servers are lightweight. They can't run everything—like database drivers. That's why we need to split our auth configuration.

## Github Keys

Since we are starting with the Github provider, we need the key and secret. Go to https://github.com/settings/developers and create a new OAuth app. Add the following to the callback:

```
http://localhost:3000/api/auth/callback/github
```

Get the api key and secret and add to the .env file as well as a Next Auth Secret, which you can generate with the following command:

```
npx auth secret
```

So your .env should have something like this:

```
AUTH_URL="http://localhost:3000"
AUTH_SECRET="c08e891a2c08e891a2"
AUTH_GITHUB_ID="Ov23liqpO0PbFlA6Awkn"
AUTH_GITHUB_SECRET="0586f7c08e891a22402d14561122270bce072d32"
```


## Load Feature

Now that we have a detailed spec file with all of our auth info, we can now load and run it. First, clear your context with `/clear` and then run:

```text
/feature load auth-phase-1-spec.md
```

This will add everything to the **current-feature.md**.

Now, run:

```text
/feature start
```

## Testing
1. Go to `/api/auth/signin`
2. Click "Sign in with GitHub"
3. Verify redirect to `/dashboard` works
4. Verify unauthenticated access to `/dashboard` redirects to sign-in

Once done, run:

```text
/feature review
/feature complete
```

Now we can start phase 2.
