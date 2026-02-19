# Section 5 Prompts

## DevStash Prototype Prompt

```text
I want to prototype a dashboard UI for my SaaS. I am going to give you the entire project overview. From that, I want you to create ONLY a mockup of the dashboard. It should not function other than visual elements. This is only to create the basic UI.

I will paste the project overview below to use as a reference for the design. Again, you are NOT creating the project as a whole but only the dashboard UI. Things like the collapsable sidebar, the main grid of collections and items, the item drawer, etc. Add dummy data for collections and items. Also, make it responsive.

## Project Overview

<!--PASTE PROJECT-OVERVIEW.md-->
```

## Iterating The Prototype

```text
In the top bar. Remove the user avatar and settings icon and put them in the bottom left in the sidebar. Remove the notification icon. Move the new item button to the right of the top bar.
```

```text
Let's move the settings gear icon to the right of the user data and remove the text "settings". Move the new collection button next to the new item button. There is also a white bar above the user area and new collection button. Remove that.
```

```text
The color codes for the items are important. We need the item cards to have a border with the item color. The collection cards should have the border color of whichever item type there is most of in that collection
```

```text
Remove the large icon from the collection cards and add small icons of all the different types that are in that collection. Put them on the bottom left.
```

```text
In the item drawer there are two close icons. Fix that. Also, add syntax highlighting to the code.
```

## Mock Data Prompt

```text
We need a single source of truth for mock data to use for the dashboard UI until we implement a database. Read @context/project-overview.md and look at @context/screenshots/dashboard-ui-main.png to see the data structure.

Create a new file at src/lib/mock-data.ts and create a simple data structure for the dashboard UI. It should include items, collections, item types and a user for the current logged in user. Do not make this too complex. It is only for displaying data in the dashboard like the screenshot. Do not create helper methods, just a simple data file to import.
```


## First Feature (Dashboard Layout) Prompt

```text
Update the @context/current-feature.md to add the feature from @context/features/dashboard-phase-1-spec.md and set the status to In Progress.
```

```text
Open a new feature branch and implement the feature in the @context/current-feature.md file.
```

```text
Set the current feature in @context/current-feature.md to completed, remove the info and add it to the history.
```

## Commit, Merge & Push Branch

```text
Commit to the feature branch, merge to main, delete the feature branch and push to remote.
```

## Prisma Setup Prompt

```text
Add a new current feature to @context/current-feature.md to implement Neon PostgreSQL and Prisma. Check @context/features/database-spec.md for requirements.
```

```text
Open a new branch and implement the current feature. Pay special attention to the details about Prisma 7.
```

```text
The .env has our development branch connection string. Go ahead and run the initial migration. Never run db push. Always run a migration so we can replicate in production.
```

## Testing Script Prompt

```text
Create a folder called 'scripts' and a file called 'test-db.ts' to test the database? Don't forget we need to install dotenv to access the env vars from the script
```

## Seed Data Feature Prompt

```text
Add a new current feature to the @context/current-feature.md to seed some sample data.

Create a seed script at @prisma/seed.ts. Reference @context/features/seed-spec.md for the data requirements and @prisma/schema.prisma for the database structure. You can overwrite the current seed script if there is one.
```

```text
Read the @context/current-feature.md file and implement the feature.
```

```text
Test to see if the data was added using the test script.
```

```text
Mark the feature as complete. Commit, merge, push and delete feature branch.
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
