# Favorites Page

Let's now implement the favorites page. We have an `isFavorite` field in both items and collections.

First thing I want to do is create some favorites. Let's use the Neon MCP to mark half the collections and items as favorites.

Run this prompt:

```text
Use the Neon MCP to mark half of the collections and items as favorites
```

I want to have kind of a unique display for favorites. I want it to resemble an editor style like VS Code.

## Feature Spec

Add the spec folder to your project `context/features/favorites-spec.md`.

Then go through the workflow:

```text
/feature load favorites-spec.md
/feature start
<!-- Test manually -->
/feature test
/feature review
/feature complete
/clear
```
