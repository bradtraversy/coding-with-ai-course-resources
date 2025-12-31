# Test Stripe In Development

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

## Resetting Your User

I usually create a reset user script. That way you don't have to keep creating new users if you want to test again.

Run the following prompt:

```text
Create a script in the @scripts folder to reset a user back to a free user. Clear any stripe data and set the isPro to false. It should take the user email as an argument. Don't forget the dotenv package
```

Now you can tell the AI to run it or run:

```bash
npx tsx scripts/reset-subscription.ts your@email.com
```

Of course, make sure the file is the right name.

## Delete Stripe Subscription

I would suggest going to your Stripe sandbox dashboard and delete the old subscription before you test again if you test with the same user.

You can now complete the feature:

```text
/feature review
/feature complete
/clear
```

Be aware that when it deploys, you will get an error because it is going to look for a webhook secret in your env variables in Vercel and we have not added it yet. We will do that in the next lesson.
