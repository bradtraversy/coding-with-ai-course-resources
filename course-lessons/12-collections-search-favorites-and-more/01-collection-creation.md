# Collection Creation

Up to this point, we have been dealing with standalone items. Now we need to start to implement collections, which can hold multiple items of any type.

I want to start with just the "create", which would be the server action, the UI and we will have some unit testing.

Let's load with manual text:

```text
/feature load Implement collection "create". We need a button in the top bar to create a new collection with a description.

We should follow the same patterns as items. Collections should be user-scoped, fetch from the server component via lib/db functions and api routes for any client-side calls

The create button should open a modal with the fields needed. Show a toast on success or failure. Make sure everything is updated with the new collection on save.
```

Run `/feature start`

Make sure that the collections are being added to the sidebar and the main dash with the default type/color that you selected in the modal.

After iterating, run:

```text
/feature test
/feature review
/feature complete
/clear
```
