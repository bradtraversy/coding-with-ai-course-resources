# Stripe Sandbox Setup

Our core application is done. At least for the moment. We have a nice MVP. Now I want to turn this into a SaaS, which means we need to be able to charge for it.

Stripe is a fantastic platform. Not only is it relatively easy to integrate payment and subscriptions, but the sandbox and test mode is easy to setup as well and you can have multiple sandboxes.

## Create An Account

If you do not have an account yet, go to https://stripe.com and create one.

You may need to go through an onboarding process and enter some information. It's been a while since I signed up. Go through any of that until you see your dashboard.

## Create A Sandbox

This is very important because you do not want to be testing with real money. Stripe gives you something called a "sandbox", which is like a replica of your real account except the payments and banks and transactions are not real.

Go to the top left and click your company name/logo and you should see "Switch To Sandbox". Click or hover that and you should see an option to create a new sandbox. Create one just for this project. Name is something like "Devstash Testing". Then switch to that sandbox. Now any data you see is not real. It will show any transactions made while in sandbox mode.

## Create Product In Stripe

We need to create the pro membership product within the Stripe dashboard. Click on"Product Catalog->Create Product" and call it **Devstash Pro** and add **$8** for the price and **Monthly** for billing period. Save that. Now click on the product you just created and add a new price of **$72** for the **yearly** billing period.

## Configure Customer Portal

Go to **Settings->Billing->Customer Portal** or just search for "portal" and make sure the following is enabled:

- Invoice History
- Cancel subscription
- Switch Plans (Add the two product prices)

Click **Save Changes**

## Environment Variables

Now we need to set some environment variables. Open your project's `.env` file and add the following:

```text
STRIPE_SECRET_KEY=""
STRIPE_PUBLISHABLE_KEY=""
STRIPE_WEBHOOK_SECRET=""
STRIPE_PRICE_ID_MONTHLY=""
STRIPE_PRICE_ID_YEARLY=""
```

Get the secret and publishable key right on the main dashboard page. They will start with **pk_test** and **sk_test**.

Skip the webhook secret for now. We will talk about webhooks next.

For the prices, go to the product catalog. Click on your DevStash Pro product and click on the dots icon next to the $8 monthly price and click **Copy Price ID** and then paste that in your monthly env variable. Do the same with yearly.

Now we are ready to plan and implement the Stripe integration.
