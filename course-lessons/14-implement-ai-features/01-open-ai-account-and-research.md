# Open AI Account Setup & AI Integration Research

In this lesson, we will setup our Open AI account, add the api key and research our project to create an AI integration plan.

## Open AI Account & API Key

Since we want to use the gpt-5-nano model in our project, we need to create an account with Open AI and get an API key.

Go to https://openai.com/api/ and log in. Click on the gear icon in the top right and then "API Keys" on the left.

Create a new key and copy it.

Now add to both your `.env` and `.env.production` file:

```
OPENAI_API_KEY=sk-proj-xxx
```

Also, go to your Vercel project and go to "Settings->Environment Variables" and add it there as well. You will have to redeploy.

## AI Integration Research

Now we want to start implementing some AI stuff. Keep in mind, this will cost a little bit of money. It will be literal pennies if you are not having other users use your site.

I want to use our **/research** command to create in depth documentation for ai integration. It will look at our current site and context and create a plan.

There is a course file at `context/research/ai-integration-research.md`. Move that file to your project. Then we can use the **/research** command as follows:

```text
/research ai-integration-research.md
```

This will create a new plan document at `/docs/ai-integration-plan.md`.

Now we have a full plan. Look it over and ask for clarification if you do not understand something.

In the next lesson, we will construct our first feature from this plan.
