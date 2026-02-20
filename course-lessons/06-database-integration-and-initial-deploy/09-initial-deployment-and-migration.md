# Initial Deployment & Production Migration

At this point you should already have some code and you should have Git setup with a local repo.

Make sure that you push to a remote Github repo if you have not done so already.

Now go to https://vercel.com and log in with Github.

From your dashboard, click "Create New" and select your Devstash repo.

Under "Build Command", set it to the following:

```
prisma generate && prisma migrate deploy && next build
```

This will generate the Prisma client and run the initial migration on your production database.

## Environment Variables

This is very important. In development, we have a `.env` file with our values. In production, we will have a lot of those same values and some different. For instance, we have a separate database URL for production.

Go down to the tab that says "Environment Variables" and uncollapse it. Now go to your `.env.production` and Add the production `DATABASE_URL`, which should be the strings from your production branch. Now go back to the Vercel page and paste them.

You will also update the **AUTH_URL** to the new Vercel domain.

Now click on **Deploy\***

If you look at the logs, while it is building, you should see the migrations run.

Once complete, You will get a vercel domain like **https://devstash.vercel.app/** but we can change that later.

## Item Type Data

You need the item types from the data as well as the demo user. Run this in the AI prompt:

```text
Can you give me SQL queries to add the system item types and the demo user to the prod db?
```

Once you get those queries, go to the SQL Editor in Neon, make sure "Production" is selected in the sidebar and then run the queries it gives you.

### Redeploy

You have to now redeploy since you changed the database structure. Go to the Vercel project and click on "Deployments". Then select "Redeploy" from the one and only deployment that was run.

Once that is done, refresh and you will see the item types.

## CI/CD

Now that we have it setup, whenever you push to your repo main branch, Vercel will be updated automatically.
