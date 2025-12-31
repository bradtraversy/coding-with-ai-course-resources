# Coding With AI Course Resources

A complete educational repository for my **Coding With AI** course on AI-assisted development by building **DevStash** - a developer knowledge hub for storing and organizing code snippets, prompts, commands, notes, files, images, and links.

This repository does NOT contain the actual code for DevStash. That can be found in a separate repo. This is a resource for documentation, context, notes, etc for people taking the course.

## Overview

This repository contains:

- **Full course curriculum** with 16 lessons on AI-assisted development
- **Project specifications** for building the DevStash application
- **Custom commands and subagents** for AI workflow optimization
- **Prompts and examples** organized by course section

## Tech Stack

The DevStash application uses:

- **Next.js 16** - App Router, Server Components
- **TypeScript** - Strict mode
- **Prisma + Neon PostgreSQL** - Database ORM and cloud database
- **NextAuth v5** - Email + GitHub authentication
- **Tailwind CSS v4 + shadcn/ui** - Styling and components
- **Cloudflare R2** - File storage
- **OpenAI GPT-4o Mini** - AI features
- **Stripe** - Payment processing

---

## Folder Structure

### `/context`

The central hub for project documentation, specifications, and planning. This is the primary reference for understanding and building DevStash.

| File                  | Description                                                                                                                                                      |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `project-overview.md` | Complete project specification including features, data models, tech stack, API architecture, auth flow, and development roadmap                                 |
| `coding-standards.md` | Code conventions covering TypeScript, React, Next.js patterns, file organization, naming conventions, styling, and database practices                            |
| `ai-interaction.md`   | AI workflow guidelines including the feature/fix workflow (Document → Branch → Implement → Test → Commit → Merge), branching strategy, and code review practices |
| `current-feature.md`  | Tracks the current feature being worked on with status, goals, and notes                                                                                         |

#### `/context/features`

Individual feature specifications for modular development (19 files):

| File                            | Description                           |
| ------------------------------- | ------------------------------------- |
| `database-spec.md`              | Database schema and Prisma setup      |
| `next-auth-spec.md`             | Authentication implementation details |
| `sidebar-spec.md`               | Sidebar navigation component          |
| `dashboard-layout-spec.md`      | Dashboard page layout structure       |
| `dashboard-collections-spec.md` | Collections display in dashboard      |
| `homepage-mockup-spec.md`       | Homepage design specification         |
| `item-list-view-spec.md`        | Item list display component           |
| `image-display-spec.md`         | Image rendering and gallery features  |
| `favorites-spec.md`             | Favorites/bookmarking functionality   |
| `pinned-spec.md`                | Pinned items feature                  |
| `pagination-spec.md`            | List pagination implementation        |
| `global-search-spec.md`         | Search functionality across all items |
| `editor-settings-spec.md`       | Code editor configuration options     |
| `code-editor-spec.md`           | Code editor component implementation  |
| `profile-spec.md`               | User profile page                     |
| `file-image-spec.md`            | File and image upload handling        |
| `ai-explain-spec.md`            | AI-powered code explanation feature   |
| `seed-spec.md`                  | Database seeding specification        |
| `small-enhancements-1.md`       | Minor improvements and fixes          |

#### `/context/research`

Research documents for technical decisions:

| File                             | Description                                      |
| -------------------------------- | ------------------------------------------------ |
| `ai-integration-research.md`     | Research on AI integration options and providers |
| `content-types-research.md`      | Analysis of content type requirements            |
| `item-crud-research.md`          | CRUD operation patterns and implementation       |
| `stripe-integration-research.md` | Payment integration research and findings        |

#### `/context/screenshots`

Visual mockups and design references:

| File                   | Description                          |
| ---------------------- | ------------------------------------ |
| `dashboard-mockup.png` | UI mockup of the dashboard interface |

---

### `/docs`

Detailed project documentation:

| File                         | Description                                                                                                                                                        |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `project-spec.md`            | Master specification covering problem statement, target users, features, data models, tech stack, monetization tiers (Free vs Pro), and UI/UX principles           |
| `content-types.md`           | Detailed reference for all 7 system item types (Snippet, Prompt, Command, Note, File, Image, Link) with properties, display requirements, and field specifications |
| `items-crud-architecture.md` | Architecture documentation for create/read/update/delete operations                                                                                                |
| `stripe-integration-plan.md` | Complete Stripe payment integration plan including webhooks and subscription management                                                                            |

---

### `/prompts`

Course prompts and examples organized by section (15 files):

| File                           | Description                            |
| ------------------------------ | -------------------------------------- |
| `prototype-example-prompts.md` | Example prompts for rapid prototyping  |
| `section-02-prompts.md`        | Vibe Coding for Prototyping            |
| `section-03-prompts.md`        | Getting Started with Claude Code       |
| `section-04-prompts.md`        | Project Planning & Context Files       |
| `section-05-prompts.md`        | Start Building DevStash                |
| `section-06-prompts.md`        | GitHub Integration & Vercel Deployment |
| `section-07-prompts.md`        | Custom Commands and Subagents          |
| `section-08-prompts.md`        | Working with MCP Servers               |
| `section-09-prompts.md`        | Implement Authentication               |
| `section-10-prompts.md`        | Item CRUD & Unit Testing               |
| `section-11-prompts.md`        | Item Display                           |
| `section-12-prompts.md`        | Collection Display                     |
| `section-13-prompts.md`        | Settings, Favorites & Tags             |
| `section-14-prompts.md`        | Home and E-commerce                    |
| `section-15-prompts.md`        | AI Features                            |

---

### `/custom-commands`

Reusable CLI command templates for AI-assisted development workflows:

| File                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `feature.md`              | Complete feature implementation workflow template with actions: load, start, review, explain, complete |
| `feature-with-testing.md` | Enhanced feature command that includes testing requirements                                            |
| `cleanup.md`              | Code cleanup and file removal workflow                                                                 |
| `research.md`             | Research documentation template for technical investigations                                           |
| `list-components.md`      | Command to list and catalog all components in the codebase                                             |

---

### `/custom-subagents`

Specialized AI subagent definitions for automated tasks:

| File              | Description                                                                   |
| ----------------- | ----------------------------------------------------------------------------- |
| `code-scanner.md` | Subagent for scanning code quality, performance issues, and security concerns |
| `ui-reviewer.md`  | Subagent for reviewing UI/UX implementation against design specifications     |

---

### `/diagrams-notes`

Course visual aids and supplementary resources. Reserved for diagrams, flowcharts, and additional notes.

---

### `/course-lessons`

Complete course curriculum organized into 16 lessons:

---

### `/sql-queries`

Database scripts and queries:

| File                   | Description                                                                                                |
| ---------------------- | ---------------------------------------------------------------------------------------------------------- |
| `add_system_types.sql` | SQL script to seed the database with system item types (Snippet, Prompt, Command, Note, File, Image, Link) |

---

## Development Workflow

The recommended workflow for features and fixes:

1. **Document** - Document the feature in `context/current-feature.md`
2. **Branch** - Create new branch (`feature/[name]` or `fix/[name]`)
3. **Implement** - Build the feature following specifications
4. **Test** - Verify in browser, run `npm run build`
5. **Iterate** - Make adjustments as needed
6. **Commit** - Only after build passes
7. **Merge** - Merge to main branch
8. **Delete Branch** - Clean up after merge
9. **Review** - Review AI-generated code
10. **Complete** - Mark as completed in `current-feature.md`

---

## License

This is educational course content. Please refer to the course terms of use for licensing information.
