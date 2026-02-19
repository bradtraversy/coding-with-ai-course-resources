# Generate Description Feature

We now have auto tagging with the help of AI. Now let's do the same type of thing for the description by creating a summary with AI. Often times, we just want to save a snippet or command, etc and not have to think about a good description. This will help the user with that.

This is easy enough to use a manual prompt:

```text
/feature load I want to be able to click an icon button to generate a good and concise description with an AI summary feature. It should look at the content and title and create a 1-2 sentence summary for the description field. No need to save first. It should just look at what is in the current inputs. Do this for all items using whatever information is available
```

Try clicking on the icon next to the description. It should add the summary into the field.

If you see any issues, iterate and fix.

Once the summary button works, you can test, review and complete:

```text
/feature test
/feature review
/feature complete
/clear
```
