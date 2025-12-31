# Favorites Page

Let's now implement the favorites page. We have an `isFavorite` field in both items and collections.

First thing I want to do is create some favorites. Let's use the Neon MCP to mark half the collections and items as favorites.

Run this prompt:

```text
Use the Neon MCP to mark half of the collections and items as favorites
```

I want to have kind of a unique display for favorites. I want it to resemble an editor style like VS Code.

## Feature Spec

Let's create a file at `context/features/favorites-spec.md` and add the content from the course file.

Then run the the following:

```text
/feature load favorites-spec.md
/feature start
<!-- Test manually -->
/feature test
/feature review
/feature complete
/clear
```

## Adding A Favorite

We need to be able to set items and collections to be a favorite.

Run the following prompt:

```text
/feature load Add a favorite button to the drawer, collection page and cards to toggle it as a favorite.
```

Then run `/feature start`

Check to make sure that you can add and remove favorites.

```text
/feature test
/feature review
/feature complete
clear
```

## Add sorting

We should also have sorting:

```text
/feature load Add client-side sorting to the favorites page. We should be able to sort by name, date and type.
```

/feature review
/feature complete
/clear
