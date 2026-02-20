# The Main Project - Devstash

I want to go over the main project for this course. Now, this is very important... This is not like other course projects where the goal is to match exactly what I have. In my react course, you write the same exact code and end up with the same project. With AI, it's too unpredictable and there are too many variables. Even if you do use the same AI tool and the same LLM and the same exact prompts, you're still probably going to end up with something different. That's just how it goes. So don't look at this as your end result needs to match mine. Look at it as you are creating your own version of the same app.

With that said, I still want to show you what I ended up with. Your project will be similar but may not look the exact same and definitely won't have the same exact code.

## About Devstash

So Devstash is a project that I actually wanted to create. Normally, as developers, we have stuff scattered everywhere. Code snippets in our editor and multiple files, prompts in our AI tools, commands in the terminal and files, links in bookmarks, notes in whatever note app. I wanted a single place for all your developer related resources. It uses Next.js, Prisma, Neon Postgres, ShadCN UI, Tailwind, Redis, Vercel for productions, Cloudflare R2 for file storage, Vitest for unit testing and a bunch of other smaller libraries.

So this is the homepage, which is one of the later things we do. We start on the dashboard first, so let's look at that.

From the dashboard, you have 7 types of items:

- Snippets
- Prompts
- Commands
- Notes
- Files
- Images
- Links

Some of these may have different fields than the others, but they are all stored in the "items" table. We left it open to be able to add custom item types later on as well.

Now in addition to items, we have collections. You can add multiple items to collections and they can be items of different types. So we may have a DevOps collection with Docker commands, Github Action snippets, links, etc.

The dashboard shows collections, recent and pinned items, stats, etc.

We can create, update, delete and read collections and items, we can also favorite them. Items can be pinned to the top as well.

Files and images have a screen that is a little different. These are uploaded and hosted on Cloudflare R2.

## Item Drawer

One of the main selling points of this app is that you can save your stuff and access it quick. There is a search palette if you hit command+k. You also have your favorites and when you click an item, it opens a quick item drawer to give you what you need. We implement a code editor called Monaco. The user has settings to control the feel of it. And we use React Markdown for the other item types. 

## Authentication

Authentication uses Next Auth v5. We use the credentials and Github provider. Since we use Prisma, we implement the Prisma adapter. We also use Redis through Upstash for rate limiting.

## Strpe Payments & Pro Users

Another big part of this project is the Stripe payments and the feature gating for pro users. We'll have a free account that will allow users to create up to 50 items and 3 collections. If they want more than that, they need to upgrade to a pro account, which is unlimited and comes with other extra features.

Free users can use all items types except for files and images. These will stored remotely in Cloudflare R2 buckets. This is similar to Amazon S3. In fact, it's compatable with the S3 SDK.

## AI Features

Pro users also get access to AI features. There are 4 features and they all use the GPT-5-nano model. The features are the following:

- Auto Tagging: When a user creates an item, you can click "Suggest Tags" and it will create tags going by the title and other fields in the form
- Description Generation: We can also do the same thing for the description. You paste your snippet or whatver, then just click the button and it will generate a description based on the snippet or content.
- Prompt Optimization: We also have prompt optimization, where if you store a prompt, the AI will create a better one that it sees fit and you can compare the two and select the one you want
- Explain This Code: This is my favorite of the 4. We have a button on snippets and commands that will have the AI explain exactly wht the code or command does. It's very thourough and opens in a new tab. It does take up to 20 or 30 seconds. I may try and find a way to make that a bit quicker.

We also have the settings page where you can delete your account, reset your password and see your stats.

So even thought it's a relatively simple app, we're developing it front to back even up to the point of launching with a domain.

Just keep in mind, this is different than other courses, so if you end up with a different result, that is absolutely fine. It's all about the workflow, not the project itself.

## The Repo

I have the repo for you guys as well - https://github.com/bradtraversy/devstash

