# Test In Production

Now that we have everything working in development, we need to work on production.

The code is all the same, however all the Stripe env variables will be different. We no longer want the sandbox.

## Stripe Setup

Log into your Stripe dashboard, but this time, use your live account. On the top left, click on the sandbox name and then **Exit Sandbox**. Now you are in **Live Mode**.

## Production Keys

In the Stripe dash, while in live mode, go to the search box and search for "API", then click on the **API Keys** link that comes up.

From here, click on **Create Secret Key** under "Standard Keys".

Check the **Your Own Integration** option.

You will probably have to authenticate.

Give your key a name and then copy the key that starts with "sk_live" and add it to your `.env.production` file.

```
STRIPE_SECRET_KEY="sk_live_xxx"
```

This file is just for your reference. It is not used in our application.

Click **Done**.

You should also have a publishable key displayed that starts with "pk_live" put that in your .env.production file as well:

```
STRIPE_PUBLISHABLE_KEY="pk_live_xxx"
```

## Production Products

Just like we created our products in test mode, we need to create them in live mode.

In Stripe, click on **Product Catalog** and then "Create Product".

Create a new product called "DevStash Pro" and make it $8 recurring monthly.

Then click on that product and add a new price for $72 yearly.

Then copy both price IDs and add them to the .env.production file:

```
STRIPE_PRICE_ID_MONTHLY="price_xxx"
STRIPE_PRICE_ID_YEARLY="price_xxx"
```

We have one more thing to add and that is our webhook.

## Prod Webhook

For development, we used the Stripe CLI to make our webhook calls. Now we need to create the webhook for our actual production site.

In the Stripe dashboard, click on the **Developers** link at the bottom left and click "Webhooks".

Click on **Add Destination**.

#### Add Events

We need to add the events we want to fire the webhook for. Add the following events by searching for them and then checking them:

- checkout.session.completed
- customer.subscription.created
- customer.subscription.updated
- customer.subscription.deleted
- invoice.payment_succeeded
- invoice.payment_failed

Click "Continue"

Select **Webhook Endpoint**

Give it a name. I will use "DevStash Endpoint"

For the **Endpoint URL**, you must add your public domain. If you are using Vercel's URL, that is fine. If you linked a top level domain, use that and add the api endpoint.

It will look something like this:

```
https://devstash.vercel.app/api/webhooks/stripe
```

Click **Create Destination\***.

## Webhook Secret

Now you should see the secret on the page you are redirected to. It will start with "whsec\_".

Put that in your .env.production file:

```
STRIPE_WEBHOOK_SECRET="whsec_xxx"
```

## Add Env Vars To Vercel

Now just copy all those Stripe environment variables and then go to your Vercel dashboard and click on **Settings->Environment Variables** and paste them in the "key" line and it should add all of them.

It will tell you to redeploy, so click the **Redeploy** button and wait a few minutes. Now your build should pass because the variables it was looking for before are now there.

## Test Production

Go to your live site and make a purchase. This time you will need to use a real payment method. This is not development where you can use the fake card number. You can cancel the subscription right away and refund your own card from the Stripe dashboard.

If something goes wrong, pay attention to any logs in your server console, browser console, Vercel logs, network tab, webhook logs. Anywhere where you can get any information. Make sure that your webhook destination endpoint is 100% correct with the right domain.

If you do not want to keep testing with real money, you can also use a sandbox in production. Just remember to switch back to live mode after you test.

## Test Subscription Cancel

One you are able to purchase a subscription in test mode, go to the settings and manage billing and make sure that you are also able to cancel your subscription. It should do this via the Stripe portal.

If you have the issue where it cancels fine but your settings still says active and renews, run this prompt:

```text
The settings page shows 'Renews on' instead of 'Access until' for a canceled subscription. Stripe returns cancel_at_period_end: false but has a cancel_at timestamp. Fix the subscription status check to handle both cancellation types
```
