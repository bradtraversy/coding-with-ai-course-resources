# Item Listings Page

I want to add the listings page feature.

We will create a spec file for this at `context/features/item-list-view-spec.md`. The file is in the course files.

Let's run the following prompt:

```text
/clear

/feature load item-list-view-spec.md
```

Build the feature:

```text
/feature start
```

Check the structure. Make sure it is adhering to our architecture. There should be an `actions/items.ts` file with the database calls and the URL structure should be /items/[type].

After it is done, check it and run `/feature review`

If it passes and you are happy with it, run `feature complete`
