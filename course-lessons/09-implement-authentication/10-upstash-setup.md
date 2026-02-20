# Upstash Account Setup

In the last lesson, we did an auth audit and one of the main things it suggested was to add rate limiting. This is to prevent brute force attacks. We want to limit requests to the auth pages.

## Upstash

We will be using Upstash for this, which is a great service that gives you a ton for free. It is used for serverless Redis databases. We use it for caching, rate limiting, session storage and more. It works great with Vercel/Edge functions and has a simple SDK.

Create a free account at https://console.upstash.com/. You can just log in with Google or Github. The free tier includes 10k commands/day which is plenty for rate limiting auth endpoints.

Go to console.upstash.com and click "Create Database"

Choose:
- Name: devstash-ratelimit (or whatever you want)
- Type: Regional (cheaper) or Global (if you need multi-region)
- Region: Pick the closest to your Vercel deployment (likely US East)

Once created, go to the database details and copy the **REST URL** and **REST Token** from the ".env" tab
That gives you your two env variables:

UPSTASH_REDIS_REST_URL=https://xxx.upstash.io
UPSTASH_REDIS_REST_TOKEN=AXxxxx...

Put these in your `.env` and `.env.production` as well as in your Vercel env variables.

