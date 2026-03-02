# Section 12 Prompts


## Collection Create Prompt

```text
/feature load Implement collection "create". We need a button in the top bar to create a new collection with a description.

We should follow the same patterns as items. Collections should be user-scoped, fetch from the server component via lib/db functions and api routes for any client-side calls

The create button should open a modal with the fields needed. Show a toast on success or failure. Make sure everything is updated with the new collection on save.
```

## Add Items To Collection Prompt

```text
/feature load Add functionality to add an item to a single or multiple collections.

Add an input to the new/edit item forms where we can select from the available collections to add the item to.

Don't worry about displaying the collection pages yet
```

## Collections Page Prompt

```text
/feature load create the /collections page and show the collections

Create the /collections/[id] page to show the items in that collection

Use the existing cards

Link the "View all collections" in the sidebar to /collections and link all collection cards to that specific collection page
```

## Collection Edit/Delete Prompt

```text
/feature load Add buttons on /collections/[id] to edit, delete and favorite. Do not implement favorites yet, just the icon/button. Add a modal for edit to edit the meta data. Add a confirmation on delete. Items should NOT be deleted, they just will not exist in that collection anymore.

On the cards at /collections and dashboard, have the 3 dots icon show a dropdown with edit, delete and favorite. Clicking anywhere else in the card, will go to that collection page.
```

## Settings Page Prompt

```text
/feature load Create a settings page. Add a link for settings in the user icon dropdown at the bottom of the sidebar. The URL should be /settings and should be protected.

Move the Account actions, which include the delete account and forgot password from the profile to the settings page.
```

