# Monaco Code Editor Integration

We want to display snippets with code highlighting. We will use the Monaco package, which is an inline code editor with syntax highlighting. We will use when we view and edit snippets.

## Feature Spec

I will use a feature spec file for this.

Create a file at `context/features/code-editor-spec.md` and add the content from the course file.

Run the following prompt:

```text
/feature load code-editor-spec.md
```

If the file looks good, run `/feature start`.

You may need to iterate things like the height of the editor and the responsiveness.

Once you are done, run

```text
/feature test
/feature review
/feature complete
/clear
```
