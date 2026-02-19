# Collection Edit & Delete

We need to be able to edit and delete collections.

Run the following prompt:

```text
/feature load Add buttons on /collections/[id] to edit, delete and favorite. Do not implement favorites yet, just the icon/button. Add a modal for edit to edit the meta data. Add a confirmation on delete. Items should NOT be deleted, they just will not exist in that collection anymore.

On the cards at /collections, have the 3 dots icon show a dropdown with edit, delete and favorite
```

Then run `/feature start`

Make sure that on the edit modal, the pre-filled data is there.

Once done iterating and testing, run:

```text
/feature test
/feature review
/feature complete
/clear
```

