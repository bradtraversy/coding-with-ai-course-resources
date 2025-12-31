# Collection Edit & Delete

We need to be able to edit and delete collections.

Run the following prompt:

```text
/feature load Add button on to the collections page to edit and delete the collection. If a collection is deleted, the items that were in it will just not belong to that collection anymore. Items do not need a collection.
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

## Code Scanner

This is a good point to do a code scan with our subagent. Run the following:

```text
/clear

Check the codebase with the code-scanner subagent for any issues and report back
```
