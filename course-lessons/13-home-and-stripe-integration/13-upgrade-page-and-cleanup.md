# Upgrade Page & Cleanup

We now have a fully functional SaaS. Stripe is working in both development and production. There are a couple things I want to do before we move to adding the AI stuff. 

## Pro Plan Text Color

First off, let's make the color of the "pro" text on the settings page lighter so it is readable.

Let's run the following prompt:

```
On the settings page, when the user is a pro user, the text "pro" is unreadable on the dark background. Make either the text or the background lighter
```

## Upgrade Path

I want to have an upgrade button for free users. Right now they can click on upgrade in the settings and on the files/images page, but I think we should put a button in the header. I also think we should have a /upgrade page with the features and the ability to select montly or yearly.

Run the following prompt:

```
We need a clear way to upgrade the user. Free users should see a button in the header that says "Upgrade". Instead of that taking them directly to the Stripe checkout, create a /upgrade page that displays the features much like we have in the pricing area of the homepage. They should be able to select the $8 monthly or the $72 yearly. Then they can click to upgrade from there to go through checkout
```

Test that out. Then I want to have that /upgrade page show when a free user tries to go to the files or images page, rather than what is there now. 

Let's run this prompt:

```
I also want the /upgrade page to show when a free user goes to items/images or items/files. Remove the current page that shows now
```


## Code Review

I think it is a good time to run a code scan/audit.

First, let's run the `cleanup` command, which will check some simple things.

```
/cleanup
```

Fix what you see fit

Now let's run a deeper codebase scan:

```
Scan the codebase for things like security issues, optimizations, repeated code and anything else that you think can be improved. Be clear and concise in your response. Do not include things that just have not been implemented and no false positives. Verify that these are actual issues.
```

Again, fix what you see fit.
