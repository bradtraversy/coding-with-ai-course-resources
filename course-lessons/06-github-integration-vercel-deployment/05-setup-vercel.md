# Setup Vercel

At this point you should already have some code and you should have Git setup with a local repo.

## Build Script

We need to run the migrations in production. There are a few ways to do this. We can add the command to the Vercel UI or we can add to the build script in the `package.json` file. That is what I am going to do.

In `package.json` add the following for **build**:

```json
"scripts": {
"build": "prisma generate && prisma migrate deploy && next build"
...
}
```

## Vercel Deploy

Now you want to make sure that you push to a remote Github repo if you have not done so already.

Now go to https://vercel.com and log in with Github.

From your dashboard, click "Create New" and select your Devstash repo.

## Environment Variables

This is very important. In development, we have a `.env` file with our values. In production, we will have a lot of those same values and some different. For instance, we have a separate database URL for production.

Go down to the tab that says "Environment Variables" and uncollapse it. Now go to your `.env.production` and just copy all of them. Your production file should be the same at this point with the exception of the `DATABASE_URL` and `DIRECT_URL`, which should be the strings from your production branch. Now go back to the Vercel page and paste them.

You will also update the **AUTH_URL** to the new Vercel domain.

Now click on **Deploy\***

If you look at the logs, while it is building, you should see the migrations run.

Once complete, You will get a vercel domain like **https://devstash.vercel.app/** but we can change that later.

## Update the domain ENV

Go to settings->environment variables and change the "AUTH_URL" to the domain name that Vercel gave you.

You will need to redeploy after changing this.

## Add System Types

You will notice on the sidebar, there is not link for snippets, commands, etc. We don't have those in the production database yet.

We can do this a few ways. I think the most straightforward is a custom SQL query.

Open the Neon dashboard and go to your production branch. Click on the **SQL Editor** and run the following:

```sql
INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'snippet', 'Code', '#3b82f6', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'snippet' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'prompt', 'Sparkles', '#8b5cf6', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'prompt' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'file', 'File', '#6b7280', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'file' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'note', 'StickyNote', '#fde047', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'note' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'image', 'Image', '#ec4899', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'image' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'link', 'Link', '#10b981', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'link' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'command', 'Terminal', '#f97316', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'command' AND "isSystem" = true);
```

Now you should see the system types in the sidebar.

## Testing

Look around and do some testing. Log in, create a user, etc. Your dev user will not work because it uses a different branch.

## CI/CD

Now that we have it setup, whenever you push to your repo main branch, Vercel will be updated automatically.
