# Section 14 Prompts

## Logo & Favicon Prompt

```text
Create a logo for the navbar. Use some kind of blue box/parcel. Make it an SVG in its own file.
```

```text
I have added a favicon.ico in the prototypes folder. Use that as the favicon.
```

## Homepage Prompt

```text
/feature load Take the HTML/CSS in the prototypes folder and make this the landing page at /. Be sure to break it up into server components. Use client for anything that needs it. Make sure the code is clean, broken up and DRY.
```

## Scan Prompt

```text
use the @code-scanner subagent to check all the code related to the homepage and look for issues and anything that could be cleaned up including component composition, magic numbers, unused code, etc
```

## UI Reviewer Prompt

```text
Use the @ui-reviewer subagent to check the websites user interface and give feedback
```

## Stripe Feature Spec Create Prompt

```text
Create two feature spec files for Stripe integration - Phase 1 (core infrastructure) and Phase 2 (integration & UI). Use @docs/stripe-integration.md for reference. Phase 1 should include unit tests for usage-limits module. Phase 2 covers webhooks, feature gating, and UI components that require Stripe CLI for testing.
```

## Files For Pro Prompt

```text
Right now it blocks free users from uploading files and images, which is good, however I don't even want free users to be able to go to the /items/files or /items/images pages. Let's show an upgrade page and also add a badge to the files and images links in the sidebar that says "Pro"
```

## Code Scan Prompt

```text
Use the @code-scanner subagent to check the stripe-related code for security issues and any other serious issues. Some things may look incorrect because you are not up to date, so use Context7 if needed.
```

## Cancel Subscription Issue Prompt

```text
The settings page shows 'Renews on' instead of 'Access until' for a canceled subscription. Stripe returns cancel_at_period_end: false but has a cancel_at timestamp. Fix the subscription status check to handle both cancellation types
```
