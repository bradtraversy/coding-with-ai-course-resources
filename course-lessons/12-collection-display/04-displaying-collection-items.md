# Displaying Collection Items

So right now we can add items to collections, but there is no way to see which collections they use. I want to do a few things in this lesson:

1. Show the collections the item belongs to on the items page.
2. Create the collections list page that lists all the items in that collection.

Let's run the following prompt:

```text
/feature load Show which collections the items belong to on both the listings page and the drawer. Use subtle but clean looking badges.

Then implement the collections page. The url should be /collections/[id].

Use dashboard layout list the item cards with the border color and icon of that item type
```

Run `/feature start`

Check the item listings and the drawer and make sure it shows the collections.

Click on a collection and it should show the items that belong to it and they should be color coded.

After iterating and testing, run:

```text
/feature review
/feature complete
/clear
```
