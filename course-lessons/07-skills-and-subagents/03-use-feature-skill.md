
# Use & Test The `/feature` Skill/Command

Let's test this out. Let's add a "Pro" badge to the files and images item types in the sidebar.

Remember, we can either load a file or direct text.

Let's try a file first.

Create a new file at `context/features/add-pro-badge-to-sidebar.md` and add the following:

```markdown
## Add Pro Badge To Sidebar

## Overview

The files and images items will be for pro users only. Add a badge that says "Pro" to the links in the sidebar.

## Requirements

- Use a ShadCN UI badge
- Make the badge subtle but clear 
```

### Load The Feature

Now run the following command in Claude:

```text
/feature load add-pro-badge-to-sidebar.md
```

It should load the requirements to the `current-feature.md` file.

### Start The Feature Implementation

Now run:

```text
/feature start
```

It will add the badge. Check it and iterate if needed.

### Explain The Code

Let's have it explain what was done:

```text
/feature explain
```

### Review & Check

Check if all the requirements were met by running:

```text
/feature review
```

It will let you know if the requirements have been met.

### Mark Complete

Now mark as complete:

```text
/feature complete
```

That will close the branch and mark as complete.

Now we have a much cleaner, automated workflow.

You don't have to create a spec file, in fact for something so simple like this, I would just have put the text in the load command.

In the next lesson, I want to create one more simple command to do some specific clean up.
