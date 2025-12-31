# Create Auth Feature

Ok so we still only have a basic dashboard. You probably thought since we're using AI and not writing code, we would have just blown through this. You could try that but I can almost guarantee you'd end up with a mess. I wanted to focus on workflow before we really went to town.

Now we want to implement one of the biggest features that we'll be adding and that is authentication. There are a few ways that you could do this. You could do it in phases, however, setting up Next-Auth, which is what we're using is pretty standard. And I don't want to have it setup to where we can't test it. So what I want to do is just create a nice feature spec to add everything we need to the feature file to run.

I also want to mention that there's been changes to how we implement the prisma adapter with Next Auth. This is stuff that I've already researched. It may or may not have picked up the changes without me specifying a few things. I'm going to put it in the spec just to be safe.

## Loading The Spec File

Let's create a new file at `context/features/next-auth-spec.md`. This is a large file so you aren't going to want to type it out. You can get it from the lesson and main course files. Put it in your project.

There are things in this file that you probably will not understand unless you are very familiar with Next, Next Auth and Prisma and Neon serverless architecture.

To summarize, the way that the adapter interacts with Edge serverless architecture has changed.

## What is Edge?

Edge is where your code runs geographically. Traditional servers run your code in one data center—say, Virginia. A user in Tokyo waits for the request to travel across the world and back. With Edge, your code runs on servers spread across the globe. The user in Tokyo hits a server in Tokyo. Faster response. The tradeoff: Edge servers are lightweight. They can't run everything—like database drivers. That's why we need to split our auth configuration.

## Why Split the Config?

Next.js middleware runs on Edge. Prisma (our database ORM) needs Node.js. They don't mix. So we are telling it to create two versions of our auth config:

- Lightweight version (auth.config.ts) - No database access, runs on Edge for middleware
- Full version (auth.ts) - Has Prisma adapter, runs on Node.js for everything else

The middleware file (proxy.ts) uses the lightweight version to check if users are logged in. The rest of the app uses the full version to actually authenticate users and store sessions.

## The Prisma Adapter Changes

If you've used NextAuth with Prisma before, you might remember using **@next-auth/prisma-adapter**. That's been deprecated. The new package is **@auth/prisma-adapter**. We also need to use Neon's serverless driver (**@neondatabase/serverless**) instead of the regular Prisma client for the adapter.

This is because Neon's serverless architecture works better with the connection pooling that NextAuth needs.

## Load Feature

Now that we have a detailed spec file with all of our auth info, we can now load and run it. First, clear your context with `/clear` and then run:

```text
/feature load next-auth-spec.md
```

This will add everything to the **current-feature.md**.

In the next lesson, we will run and test the feature.
