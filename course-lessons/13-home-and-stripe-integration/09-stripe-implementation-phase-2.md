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
