# Prisma & Data Model

Now we need to install Prisma and setup our model. A model is a schema with the data that we want including the tables, fields, field types, relationships and more.

The way it works is we run migrations that will run SQL based on our models. Prisma takes our schema file and generates the SQL to create/update our database tables. This keeps our database in sync with our code.

## What is Prisma?

Prisma is an ORM (Object-Relational Mapper) for Node.js and TypeScript. Instead of writing raw SQL queries, we interact with our database using TypeScript methods. Prisma gives us:

- **Type safety** - Auto-generated types based on our schema
- **Auto-completion** - IDE knows all our models and fields
- **Migrations** - Version control for database changes
- **Prisma Studio** - Visual database browser

## Our Models

Based on our **project-overview.md**, we need these models:

- **User** - Extended from NextAuth with isPro, stripe fields.
- **Item** - Piece of content with a type such as snippet or note.
- **ItemType** - System types like Snippets, prompts, notes, links as well as custom types.
- **Collection** - User-created folders to organize items.
- **Tag** - Reusable tags for items.
- **ItemTag** - Junction table for many-to-many relationship.

Plus the NextAuth required models (Account, Session, VerificationToken).

## Let's Set It Up

First, let's prompt Claude to install Prisma and create our schema.

```text
Add a new current feature to @context/current-feature.md to implement Neon PostgreSQL and Prisma. Check @context/features/database-spec.md for requirements.
```

I know that Prisma 7 has changed things quite a bit and it will try to use outdated syntax. Depending on when you're watching this, you may not need to specify that but it doesn't hurt.

Now see, if you were not a developer and you were vibe coding, you wouldn't know this and you'd run into issues. There are other ways to handle latest documentation such as the **Context7** MCP but we'll get more into that later.

The prompt above will install the dependencies, initialize Prisma, create the schema, and set up the Prisma client utility.

After it's done, we'll review the schema together and run our first migration.

It also will create a `.env` file with `DATABASE_URL`, which we will add our dev database connection string to. It may also add the `NEXT_AUTH` variables.

## The Model

Take a look at your model at `/prisma/schema.prisma`. We created this model. We didn't type it out, but we mapped out our data in a file, ran it through AI to create the model and then had AI reference that model. So we are the architects. Again, big difference from "vibe coding", where we just say, "build this app". You should know everything about your project at this point. You know what components, routes, models and anything else you have. If you didn't know how to code, how would you understand that stuff? It just is not feasible.

## Connect Neon

Now let's go to the Neon interface and select the **development** branch and click "Connect". Copy the database string including the password and then paste it into your `.env` file for the `DATABASE_URL` value as well as a `.env.example` file that you can commit if you want to.

I also like to create a `.env.production` file with my production variables. If you use something like Vercel, you create the variables in their platform, so you won't use this. However, I like to still create it for reference. MAKE SURE you add this to your `.gitignore` file!

## Migrations

It should ask you if you want to run your migration. If not, then prompt it to:

```text
If you have not done so, run the init migration. Never run `db push`. Always run a migration so we can replicate in production.
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
