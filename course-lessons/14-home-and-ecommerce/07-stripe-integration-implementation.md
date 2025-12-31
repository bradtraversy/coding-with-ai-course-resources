# Stripe Integration Implementation

We have documentation about how our Stripe integration should work. We also have the 2 feature spec files.

## Phase 1 Implementation

Let's load the first one into the current-feature file:

```
/feature load stripe-phase1-spec.md
```

This will load the current feature.

You can take a look at `context/current-feature.md`.

Now let's run it:

```text
/feature start
```

It will create a todo list including:

- Stripe SDK install and config
- Usage limits module: This will keep free users from using more than allocated.
- Subscription server actions
- NextAuth types include **isPro**
- Add **isPro** to session
- Write unit tests

It should do all it needs and then run the tests.

If it all passes, we should be good to commit. There is really nothing else we can do because the UI is phase 2. So we have to trust the unit tests.

Let's review and complete:

```text
/feature review
/feature complete
/clear
```

## Phase 2 Implementation

Now let's run phase 2:

```text
/feature load stripe-phase2-spec.md
```

Check the current feature file and then run:

```text
/feature start
```

Some of the things it should do:

- Create webhook handler route
- Feature gating to prevent free users from access pro features or going over limits
- Prevent file uploads for free users
- Usage limit section
- Integrate subscription details and actions in the settings page

Then it will run npm run build and test.

We are still not ready for the final test because we still need to create the webhook but there are a couple things you can check out.

## Usage Limits Section

You should see a usage limit section on your settings page. It will probably say that you are at your limit for collections, because free users can only have 3 collections. We have more from our past data seed.

## Subscription Section

Your demo user is not a pro user. So if you go to the settings page, you should see an option to upgrade. If you click on one of the prices, it should take you to the Stripe portal. However, don't do anything yet because we still need to setup a webhook, otherwise, if you make a fake purchase, the site won't know about it because Stripe needs to let it know with a Webhook. We will do that in the next lesson.

## File/Image Upload

Since you are a free user, you should not be able to upload files/images as items. Go ahead and try and it should give you an error. I want to change this a bit. I don't even want the user to be able to go to the files page.

Let's run the following prompt:

```text
Right now it blocks free users from uploading files and images, which is good, however I don't even want free users to be able to go to the /items/files or /items/images pages. Let's show an upgrade page and also add a badge to the files and images links in the sidebar that says "Pro"
```

Important: sign out and then sign back in. You need to clear the session to see the changes.

Now you should see the badge and you should see the upgrade page if you click on file or image.

In the next lesson, we will implement webhooks.
