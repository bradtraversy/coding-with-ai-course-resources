## DevStash Project Specifications

## Problem (Core Idea)

Developers keep their essentials scattered:

- Code snippets in VS Code or Notion
- AI prompts in chats
- Context files buried in projects
- Useful links in bookmarks
- Docs in random folders
- Commands in .txt files
- Project templates in GitHu gists
- Terminal commands in bash history

This creates context switching, lost knowledge, and inconsistent workflows. DevStash provides ONE fast, searchable, AI-enhanced hub for all dev knowledge & resources.

## Users

- **Everyday Developer**:
  Needs a fast way to grab snippets, prompts, commands, links.

- **AI-first Developer**:
  Saves prompts, contexts, workflows, system messages.

- **Content Creator / Educator**:
  Stores code blocks, explanations, course notes.

- **Full-stack Builder**:
  Collects patterns, boilerplates, API examples.

## Features
Here is a list of features for DevStash.

A. **Items/Item Types**
Items can have types. Users will be able to create custom types, but we will start with the following system types that can not be changed:

- snippet
- prompt
- note
- command
- file (pro only)
- image (pro only)
- link

A type can be text (snippet, note, etc), url (link) or a file (file, image) URLs should look like - `/items/snippets`.

Items should be quick to access and create within a drawer.

B. **Collections**

Users can create collections that can have items of any type. An item can belong to multiple collections (e.g., a React snippet could be in both "React Patterns" and "Interview Prep").

Some examples may be:

- React Patterns (snippets, notes)
- Context Files (files)
- Python Snippets (snippets)

C. **Search**

Powerful search across:

- Content
- Tags
- Titles
- Types

D. **Authentication**

-Email/password or GitHub sign-in.

E. **Other Features**

- Collection and item favorites
- Items pin to top
- Recently used
- Import code from a file
- Markdown editor for text types
- File upload for file types (file/image)
- Export data as different formats
- Dark mode (default for devs)
- Add/remove items to/from multiple collections
- View which collections an item belongs to

F. **AI Features (Pro only)**

- AI auto-tag suggestions
- AI Summaries
- AI Explain This Code
- Prompt optimizer

## Data

This is a rough mockup of what the data will look like. This is not set in stone:

**USER** (extends NextAuth)

- isPro (for paid users)
- stripeCustomerId (for payments)
- stripeSubscriptionId (for - subscription management)

**ITEM**

- id
- title
- contentType (text | file)
- content (text content or null if file)
- fileUrl (R2 URL or null if text)
- fileName (original filename or null)
- fileSize (bytes or null)
- url (for link types)
- description
- isFavorite
- isPinned
- language (optional for code)
- createdAt
- updatedAt
- \*fields for user, itemType, tag relations (collection relation handled via join table)

**ITEMTYPE**

- id
- name
- icon
- color
- isSystem
- \*fields for user, item relations - user will be null for system types

**COLLECTION**

- id
- name ("React Hooks", "Prototype Prompts", "Context Files")
- description (optional)
- isFavorite
- defaultTypeId (for new - collections with no items)
- createdAt
- updatedAt
- \*fields for user relation (item relation handled via join table)

**ITEMCOLLECTION** (join table)

- itemId
- collectionId
- addedAt (tracks when item was added to collection)

**TAG**

- id
- name

## Tech Stack

- Framework Next.js 16 / React 19
- SSR pages with dynamic components.
- API routes for backend needs (storing items, file uploads, AI calls)
- One codebase/repo for less overhead
- TypeScript for type safety

**Database & ORM Neon**
PostgreSQL & Prisma

- Database in the cloud
- Prisma ORM for database connection and interaction
- Prisma 7 latest (Fetch latest docs)
- Redis for caching (Maybe)
- File Storage Cloudflare R2 for file uploads
- Authentication Next-Auth v5
- Email/password
- GitHub Oauth
- IMPORTANT: NEVER use db push or directly update db structure. We will create migrations that will be run in dev and then in prod.

**AI Integration**
OpenAI gpt-5-nano model

**CSS Frameworks**
Tailwind CSS v4 with ShadCN UI

## Monetization

We will work on a freemium system.

**Free:**

- 50 items total
- 3 collections
- All system types except files/images
- Basic search
- No file or image uploads
- No AI features

**Pro ($8/month or $72/year):**

- Unlimited items
- Unlimited collections
- File & Image uploads
- Custom types (Will come later)
- AI auto-tagging
- AI code explanation
- AI prompt optimizer
- Export data (JSON/ZIP)
- Priority support

Setup the foundation for pro users, but during development, all users can access everything.

## UI/UX

**General**

- Modern, minimal, developer-focused
- Dark mode by default, light mode optional
- Clean typography, generous whitespace
- Subtle borders and shadows
- Reference: Notion, Linear, Raycast
- Syntax highlighting for codeblocks

**Layout**

- Sidebar + main content (collapsible sidebar)
- Sidebar: Item types with links to items (Snippets, commands, etc), latest collections
- Main: Grid of color coded collection cards based on the items they hold the most of (background color). Items display under collections in color coded cards (border color)
- Individual items open in a quick to access drawer

**Type Colors & Icons**

- Snippet Color: #3b82f6 (blue)
- Snippet Icon: Code
- Prompt Color: #8b5cf6 (purple)
- Prompt Icon: Sparkles
- Command Color: #f97316 (orange)
- Command Icon: Terminal
- Note Color: #fde047 (yellow)
- Note Icon: StickyNote
- File Color: #6b7280 (gray)
- File Icon: File
- Image Color: #ec4899 (pink)
- Image Icon: Image
- Link Color: #10b981 (emerald)
- Link Icon: Link

**Responsive**

- Desktop-first but mobile usable
- Sidebar becomes drawer on mobile

**Micro-interactions:**

- Smooth transitions
- Hover states on cards
- Toast notifications for actions
- Loading skeletons
