# File Display & Folders

Now we need to display the files. I want it to be sort of like a Google Drive or Dropbox style where it shows a list with file info.

This will have to create a new table in the database, so we will need to run a migration.

## Feature Spec

Create a file at `context/features/file-display-spec.md` and add the course file content.

Load the feature:

```text
/feature load file-display-spec.md
```

If the feature looks good, run `/feature start`.

Check for tests with `/feature test`

Check the file listing and make sure it matches all the requirements. Use `/feature review`.

Once it looks right, run `/feature complete`.

Now when I do some updates outside the course, I will probably add folder functionality because that helps to organize, but I think it's fine for now.
