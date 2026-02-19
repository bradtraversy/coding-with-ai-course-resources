# Prisma Initial Migration


Once Prisma get's setup, you want to run the initial migration. It may ask you if you want to do this, if not, then do it yourself:

```text
The .env has our development branch connection string. Go ahead and run the initial migration. Never run db push. Always run a migration so we can replicate in production.
```

Just so you know how to create a migration and run it manually:

```bash
npx prisma migrate dev --name init
```

This creates the file and applies it to the database.

When in production, you would run:

```bash
npx prisma migrate deploy
```

This would run ALL migrations in your **prisma/migrations** folder. This keeps it in sync with development. Just the structure not the data.

## Add Section To Interactions File

I think we should add a database section to the `context/coding-standars.md` file:

```markdown
## Database

- Use Prisma ORM for all database operations
- Always use `prisma migrate dev` for schema changes (not `db push`)
- Run `prisma migrate status` before committing to verify migrations are in sync
- Production deployments must run `prisma migrate deploy` before the app starts
```

It should have created a "migrations" folder with the new migration and ran it.

Check the status with:

```bash
npx prisma migrate status
```

If it was not run, tell prisma to run it again.

Go to Neon and check your development branch and use the table viewer and you should see the tables.

For production, what we do is make it so when we deploy to Vercel, it also runs the migration but on the production database. That way they are always in sync. We will do that in a bit.

## Testing Script

Before we do anything else, let's create a testing script to make sure that we can connect.

Add the following prompt:

```text
Create a folder called 'scripts' and a file called 'test-db.ts' to test the database? Don't forget we need to install dotenv to access the env vars from the script
```

If it worked, great. If not, read the errors and iterate until it does work.

## Commit, Merge & Push Branch

```text
Commit to the feature branch and merge to main. Once merged, delete the feature branch and mark the feature as completed in the @context/current-feature.md file
```

Let's also clear our context with `/clear`

In the next lesson, we'll seed some data.
