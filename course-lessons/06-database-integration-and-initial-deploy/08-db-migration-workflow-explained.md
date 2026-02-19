# DB Migration Workflow Explained

Ok so now I want to deploy our site. In the old days, a lot of the time, we would build our site locally until it was complete and then upload it to production, which often was a complete nightmare.

In modern times, we have CI/CD or continuous integration, continuous deployment. This allows us to just setup a remote repo and when we push to it, our new files are pushed to production. You can also integrate tools like Github actions if you want to do certain things like maybe run tests before you push.

## Database Migrations

Now since we have a development branch and a production branch, we have to make sure that these are always in sync in terms of the structure (not the data). We handle this with migrations.

The process for this is whenever we add to our Prisma Schema as far as new tables or indexes, we need to create a migration file. This file shows any changes that were made. Maybe we added a new field to the user table or something like that. Our production branch needs to know about it.

If you look in your `prisma/migrations` folder you should see the **init** folder with a `migration.sql` file that has all the table setup and all the initial structure. We ran this in dev, but once we push, we need to run this in Vercel.

Then later if we decide to add a new table or field or anything like that, we need to create a new migration and run it locally like this:

```bash
npx prisma migrate dev --name <migration_name>
```

You dont' need to run this, it is just to show you the command.

This generates a migration file in the `prisma/migrations` folder. The file contains the SQL needed to transform the database from its current state to match your updated schema.

For example, if we added an `avatar` field to our User
model, we might run:

```bash
npx prisma migrate dev --name add_user_avatar
```

This creates a timestamped folder like `20250615123456_add_user_avatar` containing a `migration.sql` file with the actual SQL commands.

## Production Migrations

In development, `prisma migrate dev` is interactive - it can reset your database, prompt you for input, etc. But in production, we need something non-interactive that just applies pending migrations.

That's where `prisma migrate deploy` comes in:

```bash
npx prisma migrate deploy
```

This command:

- Looks at the `prisma/migrations` folder
- Checks which migrations have already been applied to the database
- Applies any pending migrations in order

It won't generate new migrations or modify your schema - it only applies what's already been created. This is exactly what we want in a CI/CD pipeline.

## Dev/Prod Database Workflow

1. Make changes to `schema.prisma` locally
2. Run `npx prisma migrate dev --name describe_your_change`
3. Commit the migration files to git
4. Push to your repo
5. CI/CD pipeline runs `npx prisma migrate deploy` on production

## What Is "Drift"?

Drift is when your database schema gets out of sync with your migration history. This can happen if:

- Someone manually edits the database directly (adding columns, changing types, etc.)
- You run `prisma db push` instead of `migrate dev` during development
- A migration was applied in one environment but not another

When drift happens, Prisma doesn't know the true state of your database anymore. Your migration files say one thing, but the actual database looks different.

This seems to happen quite a lot when working with AI. Sometimes it does stuff like this without asking. It might be a good idea to establish some rules around this.

You can always check the status with:

```bash
npx prisma migrate status
```

In fact go ahead and run it right now.

When you do get drift, you can check your migrations against your database and see what is missing with:

```bash
npx prisma migrate diff
```

In a worst-case scenario, you might need to baseline your database - essentially telling Prisma "this is the current state, start fresh from here." But if you follow the workflow properly, you shouldn't run into this.
