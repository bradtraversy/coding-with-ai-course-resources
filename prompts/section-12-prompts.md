# Section 12 Prompts

## Collection Create Prompt:

```text
/feature load Implement collection "create". We need a button in the top bar to create a new collection with a description.

Create the action.Collections are user-scoped and stick to the same patterns for other actions.

Button open a modal with the fields needed. Show a toast on success or failure. Make sure everything is updated with the new collection on save.
```

## Add Items To Collections Prompt

```text
/feature load Add functionality to add an item to a single or multiple collections.

Add an input to the new/edit item forms where we can select from the available collections to add the item to.

Don't worry about displaying the collection pages yet
```

## Show Item Collections Prompt

```text
/feature load Show which collections the items belong to on both the listings page and the drawer. Use subtle but clean looking badges.

Then implement the collections page. The url should be /collections/[id].

Use dashboard layout list the item cards with the border color and icon of that item type
```

## Edit & Delete Collection Prompt

```text
/feature load Add button on to the collections page to edit and delete the collection. If a collection is deleted, the items that were in it will just not belong to that collection anymore. Items do not need a collection.
```
