# Prisma 7 Setup

## What is Prisma?

Prisma is an ORM (Object-Relational Mapper) for Node.js and TypeScript. Instead of writing raw SQL queries, we interact with our database using TypeScript methods. Prisma gives us:

- **Type safety** - Auto-generated types based on our schema
- **Auto-completion** - IDE knows all our models and fields
- **Migrations** - Version control for database changes
- **Prisma Studio** - Visual database browser

## Our Models

A model  is a schema of your data that includes the fields, types, constraints and more. It shapes your database.

Based on our **project-overview.md**, we need these models:

- **User** - Extended from NextAuth with isPro, stripe fields.
- **Item** - Piece of content with a type such as snippet or note.
- **ItemType** - System types like Snippets, prompts, notes, links as well as custom types.
- **Collection** - User-created folders to organize items.
- **Tag** - Reusable tags for items.
- **ItemTag** - Junction table for many-to-many relationship.

Plus the NextAuth required models (Account, Session, VerificationToken).

## Let's Set It Up


Take the `/context/features/database-spec.md` file from the resource files and move to your project.

Then prompt Claude to install Prisma and create our schema.

```text
Add a new current feature to @context/current-feature.md to implement Neon PostgreSQL and Prisma. Check @context/features/database-spec.md for requirements.
```

I know that Prisma 7 has changed things quite a bit and it will try to use outdated syntax. Depending on when you're watching this, you may not need to specify that but it doesn't hurt.

Now see, if you were not a developer and you were vibe coding, you wouldn't know this and you'd run into issues. There are other ways to handle latest documentation such as the **Context7** MCP but we'll get more into that later.

The prompt above will install the dependencies, initialize Prisma, create the schema, and set up the Prisma client utility.

After it's done, we'll review the schema together and run our first migration.

## `.env` File & `DATABASE_URL`

Create a `.env` file with `DATABASE_URL`, which we will add our DEVELOPMENT branch connection string. MAKE SURE you add `.env` to your `.gitignore`!

## The Model

Take a look at your model at `/prisma/schema.prisma`. We created this model. We didn't type it out, but we mapped out our data in a file, ran it through AI to create the model and then had AI reference that model. So we are the architects. Again, big difference from "vibe coding", where we just say, "build this app". You should know everything about your project at this point. You know what components, routes, models and anything else you have. If you didn't know how to code, how would you understand that stuff? It just is not feasible.

In the next lesson, we will run the initial migration.
