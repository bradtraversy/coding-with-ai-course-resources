# Item Edit Mode

We have our drawer. Now I want to be able to edit an item.

Let's run the following prompt:

```text
feature load Add edit item functionality. Edit should be snappy and should just change the drawer to "edit mode" with the correct fields for that item type. I would like the "text" types to use a markdown editor.

```

Run through the workflow:

```text
/feature start
/feature test
/feature review
/feature complete
```

I ran into the issue of not having the save and cancel buttons visible for long snippets. I ran the following to fix:

```text
When I open a drawer and edit and the content is too long, I can not see the save button. There is no scroll. Open a browser and go to http://localhost:3000/items/snippet and click on the Docker compose template snippet and click the edit button to see what I mean
```
