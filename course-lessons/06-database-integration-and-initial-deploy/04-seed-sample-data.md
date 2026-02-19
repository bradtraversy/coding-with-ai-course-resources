# Seeding Data

Now that we have our database connected and working, let's seed some data that we can then fetch from our project.

I have prepared a file called `seed-spec.md` with the data to add. Add this to `/context/features/seed-spec.md`.

Let's first add the script task to the current feature file. I will have the AI do that.

Let's run this prompt:

```text
Add a new current feature to the @context/current-feature.md to seed some sample data.

Create a seed script at @prisma/seed.ts. Reference @context/features/seed-spec.md for the data requirements and @prisma/schema.prisma for the database structure. You can overwrite the current seed script if there is one.
```

Check the file and you should have a nice feature document.

Next, tell the AI to create the feature:

```text
Read the @context/current-feature.md file and implement the feature.
```

Now it will create the seed script and run it.

You can now test it using your **test-db** script if it did not do it automatically:

```text
Test to see if the data was added using the test script
```

## Prisma Studio

We can also check the data ourselves either through Neon's dashboard or with Prisma Studio.

Let's run Prisma Studio in a new terminal:

```bash
npx prisma studio
```

Check the `User`, `Item`, `ItemType` and `Collection` tables for data.
