# The Main Project: DevStash

Before diving in, there's something important to understand about this course project — it's nothing like a typical course project.

In most of my courses, you write the same code and end up with the same result. With AI, that's simply not possible. Even if you use the same tool, the same model, and the same exact prompts, you'll almost certainly end up with something different. That's just the nature of working with AI. So don't measure your progress by whether your project matches mine. Think of it as building your own version of the same app.

With that framing in place, here's what we're building.

## What Is DevStash?

DevStash is an app I've wanted to build for a while. As developers, we tend to have resources scattered everywhere — code snippets buried in files, prompts living inside AI tools, commands sitting in the terminal, links saved across multiple browsers, notes spread across different apps. DevStash is a single, organized place for all of it.

This is not a vibe-coded project where we let the AI pick the stack. I chose what is, for me, the ideal stack for most modern web apps.

## Tech Stack

**Next.js 16 & React 19** — The core framework. We're using the latest versions at the time of recording.

**TypeScript** — Non-negotiable at this point. Unless you're a complete beginner, there's no good reason to reach for plain JavaScript anymore. It integrates easily and comes as the default in most modern boilerplate setups.

**Neon PostgreSQL** — A serverless Postgres database and my go-to for pretty much any web project. The free tier is generous enough to get through the entire course. No local Postgres installation, no complicated setup — just create a project and you're ready to go. We'll create both a development and production branch for DevStash.

**Prisma ORM** — Handles the connection between our app and the database. We define data models, run migrations to create tables, and use the Prisma client to run queries instead of writing raw SQL.

**Cloudflare R2** — File and image storage. It's easier to set up than Amazon S3 and is S3-compatible, so we'll use the S3 SDK with it.

**Tailwind v4 & shadcn/ui** — Tailwind for styling, shadcn/ui for reusable component primitives.

**NextAuth v5** — Full authentication including email/password credentials, GitHub OAuth, email verification, and forgot password flows.

**Other libraries** — Resend for transactional email, Upstash Redis for rate limiting, and the Stripe SDK for payments. This is a real-world project, not a todo list.

We'll finish with a complete deployment to Vercel.

## What You're Building

The dashboard is the heart of the app. Users can save and manage seven types of items: snippets, prompts, commands, notes, files, images, and links. Each type may have different fields, but they all live in the same `items` table — designed to be extensible if you want to add custom types later.

Beyond individual items, users can create **collections** — groupings of mixed item types. A DevOps collection might contain Docker commands, GitHub Actions snippets, and relevant links all in one place. Items can be favorited, pinned to the top, or searched instantly via a command palette (`⌘K`).

When you click an item, it opens in a quick-access drawer. Snippets and commands render in a Monaco code editor (the same one used in VS Code), with user-controlled settings for feel and appearance. Other item types render through React Markdown.

## Authentication

Authentication runs on NextAuth v5 using both the credentials provider and GitHub OAuth. We implement the Prisma adapter for database-backed sessions, and Upstash Redis handles rate limiting.

## Stripe Payments & Feature Gating

The app has a freemium model. Free users can create up to 50 items and 3 collections, with access to all item types except files and images. Pro users get unlimited items and collections, file/image uploads to Cloudflare R2, and access to the AI features.

## AI Features

Pro users get four AI-powered features, all powered by the GPT-4o mini model:

**Auto Tagging** — Click "Suggest Tags" when creating an item and the AI generates relevant tags based on the title and content.

**Description Generation** — Paste your snippet or content, click a button, and get an auto-generated description.

**Prompt Optimization** — For stored prompts, the AI rewrites an improved version. You can compare both and choose the one you want to keep.

**Explain This Code** — My personal favorite. Available on snippets and commands, this opens a detailed explanation of exactly what the code does in a new tab. It's thorough, though it can take 20–30 seconds to generate.

## The Repo

The finished project is available at [github.com/bradtraversy/devstash](https://github.com/bradtraversy/devstash) for reference.

Just remember — if your version looks different, that's expected and completely fine. The project is the vehicle. The workflow is the destination.