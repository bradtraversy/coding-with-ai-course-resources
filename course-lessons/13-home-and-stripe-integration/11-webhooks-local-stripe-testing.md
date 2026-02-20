# Webhooks & Local Stripe Testing

Now we need to setup the Stripe CLI so that we can setup to test our webhooks locally when we create them. Before we do that, let's talk about what webhooks are.

## What Are Webhooks?

A webhook lets our application know when something important happens such as a payment succeeding, subscription being canceled, etc. We need to know this stuff because we need certain things to happen with these events.

Instead of your app constantly asking Stripe "did anything happen yet?" (polling), Stripe just pings your endpoint when events occur. You set up a URL on your server, Stripe sends a POST request with these event data, and your code handles it however you need.

The way this works is we setup an API endpoint in our application that the webhook can send a request to. Something like `/api/webhooks/stripe`. When a user pays an invoice or cancels a subscription, etc, Stripes webhook sends a request to our API and then we update our database and do whatever it is we want to do when that event happens. Fo instance, if a user pays an invoice, you may have a function called `updateUser` that sets the **isPro** to true and records payment.

## Events To Listen For

There are a ton of different events, but we only need a select few:

- **checkout.session.completed** - User completes checkout, upgrades to Pro
- **customer.subscription.updated** - Subscription status changes (active/trialing/canceled)
- **customer.subscription.deleted** - Subscription fully deleted, removes Pro access
- **invoice.payment_failed** - Payment failed (logged for monitoring)
- **customer.subscription.created** - New subscription created
- **invoice.payment_succeeded** - Successful payment

We check these in the Stripe dashboard when we create our production webhook.

## Development vs Production

It is very important to understand that you need to setup a webhook in development and in production and in different ways. In production, we setup the webhook through the Stripe dashboard we tell it our production URL for the webhook endpoint and the events we want. We will do that in a little bit.

In development, the dashboard-setup webhooks can not reach our localhost because we are not accessible.

## Stripe CLI

There are a few ways around this, what is recommended is that we use the Stripe CLI. We run a command and it watches our webhook endpoint.

Setup is different depending on your environment.

### MacOS

You can use Homebrew:

```bash
brew install stripe/stripe-cli/stripe
```

You should then be able to run:

```bash
stripe help
```

## Windows

On Windows, you can use Scoop or Chocolatey.

I prefer Scoop. You can install the Scoop package manager with this Powershell command:

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

Then run:

```bash
scoop bucket add stripe https://github.com/stripe/scoop-stripe-cli.git

scoop install stripe
```

Now you should be able to run:

```bash
stripe help
```

OR if you don't want to install Scoop, you can download the compressed ZIP here - https://github.com/stripe/stripe-cli/releases/tag/v1.34.0

Download the **stripe_1.34.0_windows_x86_64.zip** extract it where you want and then add it to your PATH variable.

## Run `stripe listen`

The `stripe listen` command creates a tunnel between Stripe's servers and your local development machine.

How it works:

- When a payment event happens on Stripe (like someone completing checkout), Stripe needs to tell your app about it
- But Stripe can't reach localhost:3000 - that's only on your computer
- `stripe listen` acts as a middleman - Stripe sends events to Stripe's CLI, which forwards them to your local server

You also need to specify your endpoint.

Run the following command in a terminal:

```bash
stripe listen --forward-to localhost:3000/api/webhooks/stripe
```

Now it will run and show you your webhook secret, which will begin with **whsec\_**. Take this and put it in your .env file.

It will look like this:

```
STRIPE_WEBHOOK_SECRET="whsec_xxx"
```

It is important to know that when you are testing in development, this has to be running. And when you restart, it will give a new secret that you will have to update.

## Test Stripe In Development

Now we want to test our entire checkout system in development.

- Create a new user
- Confirm email
- Make sure file and images are blocked
- Purchase the pro plan
- Make sure the user isPro and subscription was created

With Stripe test mode, just use the card number **4242 4242 4242 4242** and it will mock a real purchase. You can use any other values for the other fields.

Make sure your terminal is open with the `stripe listen` command.

When you make the test purchase, you should see a bunch of POST requests in that terminal for the events that fire off.

It will redirect you to the settings page and you should now see that you are a pro member.

