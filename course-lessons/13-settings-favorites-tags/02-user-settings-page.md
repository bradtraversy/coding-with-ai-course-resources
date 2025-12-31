# User Settings Page

Right now, we have the account actions (delete account and change password) in the profile. Those are things that should be on a settings page.

Let's create the settings page and route and move those actions there.

Run the following prompt:

```text
/feature load Create the settings page and link to sidebar settings link. The URL should be /settings and should be protected.

Move the Account actions, which include the delete account and forgot password to the settings page.
```

Complete the feature.

## Editor Settings

I want the user to be able to control their editor settings for snippets and commands.

Create the spec file at `/context/features/editor-settings-spec.md` and add the content from the course file.

```text
/feature load editor-settings-spec.md
/feature start
<!-- Test manually -->
/feature test
/feature review
/feature complete
/clear
```
