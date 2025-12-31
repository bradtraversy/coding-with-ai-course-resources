# Our First Feature - Dashboard Layout

Now that we have a mockup and idea for our dashboard, let's add that as our first feature.

## Verification Prompt

One thing I like to do before I start building is have it read all the main context files and summarize the project for me so that I know it has the full picture.

Let's run the following prompt:

```text
Read the @CLAUDE.md file and the referenced files and give me a summary
```

Once you run the prompt, it will read through the files.

## Clear Context

Before each feature, I suggest clearing up the context. Run the following command in Claude:

```text
/clear
```

## First Feature Prompt

Let's add our first feature. I do this in multiple phases depending on how big the feature and prompt will be. This is a really big one because we are doing the entire dashboard layout. No functionality, but still, it's a lot to generate. So what I do is add what I want to a spec file.

Create a new folder at `context/features`. This is where our feature spec files will go. Then we can feed them to the prompt instead of typing it all in. We can also save them for reference to see exactly how we got that feature.

In the lesson and in the course files you will find a `dashboard-layout-spec.md` file. Put that in the `context/features` folder and take a look at it.

This has some information of what I want including the reference to the prototype image and a list of specifications. That way I'm not creating a prompt that is 20+ lines long.

Now we can create a prompt and reference the file:

```text
Update @context/current-feature.md with the feature from @context/features/dashboard-layout-spec.md
```

Now check out the `current-feature.md` file and you should see it get updated.

Now you can just run the following:

```text
Create a new branch and implement the feature in @context/current-feature.md
```

## ShadCN Setup & Allowing npx shadcn commands

It should go on to setup ShadCN. It will ask us for every command, but there are some things you may not want it to ask for. For instance, I'll let it run ShadCN install commands without asking. So I will select the "Yes, don't ask again" option for that.

It should get added to your allow list in the settings file.

## Other Components

The next thing it will probably do is the sidebar component. I suggest looking at these files as they are created. This is not vibe coding, where you just let it run wild. We are structuring the project how we want and then looking over the code. The only real difference is we aren't typing. And of course, we may overlook some things, but that's the price to pay to 10-20x your productivity. You just have to know how to debug if something goes wrong.

Look over the files that are created. They should go along with our outline. SSR pages and components by default, but client components if they are dynamic. The sidebar uses the `useState` hook, so it will be client side.

Look over the other 4-5 components it creates and then the main `DashboardLayout` file. It will probably create a barrel `dashboard/index.ts` file so we can import from one place.

Then it will create the actual page for the route. This should import the cards components. It will use mock data for now.

Then it will bring the `DashboardLayout` into the main layout file since we only have one layout at the moment.

It will install Lucide React if it has not already. I will give it permission to run NPM commands. Now `npm install` will be added to the allow list in the `settings.local.json` file.

## Make Changes / Diff

Now it will make some changes like the Meta description. You should see a diff file that shows green where added and red where removed.

Now it will ask to run `npm run build`, which will check for TS and linting errors. I usually allow this. So I will select to always allow.

If anything comes up, it will fix it. If not, it passes and should give you a summary of what was done.

Now it's time to test. Open your browser and go to **http://localhost:3000/dashboard** and inspect the output.

Check the following:

- Is it responsive?
- Do you like the overall layout/colors?

If not, we need to iterate.

## Sidebar Not Collapsing On Mobile

Let's say that the layout is NOT responsive and the sidebar does not collapse like we specified. This may or may not have happened with your project. Let's pretend it did.

There are multiple ways to handle this. Right now, we can just describe it or take a screenshot, but later I'll show you how we can setup an MCP (Model Context Protocol) so that Claude can basically get automatic screenshots when needed.

For now, let's tell it:

```text
The layout looks good but it is not fully responsive as the sidebar does not collapse on mobile
```

Once it looks good, let's commit, merge and push. It should have already ran `npm run build`

```text
Commit to the feature branch and merge to main. Once merged, delete the feature branch and mark the feature as completed in the @context/current-feature.md file
```

Now check the `current-feature.md` file. It should be clear.

Later we will actually have a single command that will do all this for us.
