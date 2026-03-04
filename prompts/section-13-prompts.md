# Section 13 Prompts

## Homepage HTML/CSS Mockup Prompts

```text
Make the icons in the hero a bit bigger and they should not move so fast on mouse cursor reaction
```

```text
The mockup in the hero looks a bit empty. Do you have any suggestions?
```

```text
Make the icons a bit bigger in the homepage prototype hero
```

```text
what if we added some text to the mockup in the hero for the section names?
```

```text
Give the features section background a bit of a lighter color to add separation
```

```text
For the text and buttons, use the blue from the snippets icon type rather than the purple colors
```

## Homepage Spec File Creation

```text
Create a spec file at @context/features called homepage-spec.md to take the mockup in the @prototypes/homepage folder and create the actual app homepage from it. Here are some guidelines to add in the spec: 

- Page broken up into server components and client components where needed for interactivity
- Use Tailwind/ShadCN like the rest of the project
- Keep code clean and dry
- Make buttons and links go to the correct places

Look at the spec files in the @context/features folder for reference. Keep it concise but complete
```

## Top Bar Responsiveness

```text
The dashboard top bar is much too cluttered on small screens. Look at it with Playwright and give me some suggestions
```

## UI Reviewer Prompt

```text
Use the @ui-reviewer subagent to check the websites user interface and give feedback. Check the homepage and dashbaord pages. Use the demo@devstash.io/12345678 login to access protected areas
```

## Stripe Integration Docs Prompt

```text
Create two feature spec files for Stripe integration - Phase 1 (core infrastructure) and Phase 2 (integration & UI). Use @docs/stripe-integration-plan.md for reference. Phase 1 should include unit tests for usage-limits module. Phase 2 covers webhooks, feature gating, and UI components that require Stripe CLI for testing. 
```

## Feature Gate Prompts

```text
Change the demo user seed data to only have 3 collections since it is a free user and they are limited to 3. Then run the clear user script, which deletes all users but the demo user and seeds their content. They should also have under 50 items
```

```text
I don't want free users to be able to go to the /items/files or /items/images. Let's show an upgrade page if they visit those links
```

## Upgrade Path Prompts

```
On the settings page, when the user is a pro user, the text "pro" is unreadable on the dark background. Make either the text or the background lighter
```

```
We need a clear way to upgrade the user. Free users should see a button in the header that says "Upgrade". Instead of taking them directly to the Stripe checkout, create a /upgrade page that displays the features much like we have in the pricing area of the homepage. They should be able to select the $8 monthly or the $72 yearly. Then they can click to upgrade from there to go through checkout. Make the upgrade button more subtle thatn the other nav buttons. Use a ghost button.
```

```
I also want the /upgrade page to show when a free user goes to items/images or items/files. Remove the current page that shows now
```


