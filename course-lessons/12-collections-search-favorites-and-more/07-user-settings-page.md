# User Settings Page

Right now, we have the account actions (delete account and change password) in the profile. Those are things that should be on a settings page in my opinion. So I want a settings page with that stuff. I also want to have editor settings such as font size. I am going to do these in two separate features.

Let's create the settings page and route and move the account actions there. I will use an inline prompt with `/feature load`:

```text
/feature load Create a settings page. Add a gear icon to the right of the user info at the bottom of the sidebar and link that. The URL should be /settings and should be protected.

Move the Account actions, which include the delete account and forgot password from the profile to the settings page.
```

Complete the feature.

