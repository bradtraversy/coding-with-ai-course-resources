# Create Item

The last CRUD operation will be the create. We want to add a create button on the listings page.

Let's load the feature:

```text
/feature load add a create button to create a new item. This should open a modal with a type dropdown. Some fields will  depend on the type. Only show the type-specific fields when that type is selected.

Note and prompt items will be able to accept markdown. Add that as an info blurb near the text field.

Files and images will have an upload field but no functionality yet.

Snippets and commands will have an editor but we will do that later.
```

Iterate where necessary.

Make sure that when you add an item, it show on the page right away with no refresh needed. Sometimes it forgets to do things like this:

```jsx
useEffect(() => {
  setItems(initialItems);
}, [initialItems]);
```

When you are done testing:

```text
/feature test
/feature review
/feature complete
/clear
```

## Code Scan

This is a good point to do a code scan as well:

```text
Use the code-scanner subagent to check the codebase for issues and report back
```

Be aware of false flags and things we have not added yet. I suggest addressing quick wins.
