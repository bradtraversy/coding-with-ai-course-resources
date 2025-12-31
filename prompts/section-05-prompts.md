# Section 5 Prompts

## DevStash Prototype Prompt

```text
Create me a mockup of a dashboard page for a project called DevStash that is used to let developers create "Collections" of "Items" which can be snippets, prompts, notes, commands, files, images and links. Here are some guidelines:

## **General Feel**

- Minimal and modern
- Dev‑focused, dark by default
- Inspired by Notion, Linear, Raycast

## **Layout**

- Collapsible sidebar
- Main content grid/list
- Top bar with search on left and user icon on right
- Collection cards in main section with the background color and icon that pertain to the content type within it
- Stats above collection cards (Total collection & item count, favorite collection count, last updated )
- Sidebar with types with icon and most recent collections
- Settings link at bottom of sidebar

## **Responsive Notes**

- Sidebar becomes drawer on mobile
- Touch-friendly interactions

## **Micro-interactions**

- Soft shadows
- Smooth transitions
- Creeping loading bars
- Toast success/error messages

This should just be the Dashboard UI, not a working app.
```

## Create a GitHub Repo

```text
Create a GitHub repo called devstash and push this project
```

## Verification Prompt

```text
Read the @CLAUDE.md file and the referenced files and give me a summary
```

## First Feature (Dashboard Layout) Prompt

```text
Update @context/current-feature.md with the feature from @context/features/dashboard-layout-spec.md
```

```text
Create a new branch and implement the feature in @context/current-feature.md
```

## If Not Responsive Prompt

```text
The layout looks good but it is not fully responsive as the sidebar does not collapse on mobile
```

## Commit, Merge & Push Branch

```text
commit to the feature branch and merge to main. Once merged, delete the feature branch and mark the feature as completed in the @context/current-feature.md file
```

## Prisma Setup Prompt

```text
Add a new current feature to @context/current-feature.md to implement Neon PostgreSQL and Prisma. Check @context/features/database-spec.md for requirements.
```

```text
If you have not done so, run the init migration. Never run `db push`. Always run a migration so we can replicate in production.
```

## Testing Script Prompt

```text
Create a folder called 'scripts' and a file called 'test-db.ts' to test the database? Don't forget we need to install dotenv to access the env vars from the script
```

## Seed Data Feature Prompt

```text
Add a new current feature to the @context/current-feature.md to seed some sample data.

Create a seed script at @prisma/seed.ts. Reference @context/features/seed-spec.md for the data requirements and @prisma/schema.prisma for the database structure.

Do not run this yet, just create the feature in the file.
```

```text
Read the @context/current-feature.md file and implement the feature
```

```text
Test to see if the data was added using the test script
```

```text
Mark the feature as complete. Commit, merge and push
```

## Show Collections In Dash Prompt

```text
Add a new feature to the @context/current-feature.md file. Use the feature specs from @context/features/dashboard-collections-spec.md
```

```text
Create a new branch and implement the feature in the @context/current-feature.md file
```

```text
Mark this feature as completed then commit, merge and push
```

## Sidebar Feature Prompt

```prompt
Add a new current feature. Check @context/features/sidebar-spec.md.
```

```text
Implement the feature in @context/current-feature.md
```

```text
Order and rename the types within the sidebar - Snippets, Prompts, Notes, Files, Images, Links and make the first letter uppercase
```
