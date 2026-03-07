# Coding With AI - Course Resources

Resources, prompts, lesson notes, feature specs, and more for the **Coding With AI** course — where we learn AI-assisted development by building **DevStash**, a centralized developer knowledge/resource hub.

> **Note:** This repo does NOT contain the DevStash source code. That lives in a [separate repository](https://github.com/bradtraversy/devstash). This is the companion resource for students taking the course.

| | Link |
| --- | --- |
| **Course** | Coming Soon |
| **DevStash Repo** | [github.com/bradtraversy/devstash](https://github.com/bradtraversy/devstash) |

---

## Table of Contents

- [📚 What You'll Learn](#-what-youll-learn)
- [🚀 How to Use This Repo](#-how-to-use-this-repo)
- [🔄 Development Workflow](#-development-workflow)
- [🎓 Course Curriculum](#-course-curriculum)
- [📁 Folder Structure](#-folder-structure)
- [🔀 AI Tool Equivalents](#-ai-tool-equivalents)
- [🛠️ Course Project Tech Stack](#️-course-project-tech-stack)
- [📄 License](#-license)

---

## 📚 What You'll Learn

- 🤖 How to use AI tools in a real development workflow
- ⚡ Vibe coding for rapid prototyping vs. production-grade development
- 📋 Project planning, context files, and AI interaction strategies
- 🏗️ Building a SaaS/full-stack app from scratch with AI assistance
- 🔧 Custom skills, subagents, and MCP servers
- 🔐 Authentication, Stripe payments, file storage, and AI feature integration

## 🚀 How to Use This Repo

1. **Follow along with the course** — Open the lesson notes in `course-lessons/` as you watch each video
2. **Copy prompts** — Use the prompts in `prompts/` as starting points when building alongside the course
3. **Reference specs** — Check `context/features/` for detailed feature specifications when implementing
4. **Set up your own skills** — Copy the `skills/` folder into your project's `.claude/skills/` directory
5. **Study the docs** — Read through `docs/` for architecture decisions and integration plans

---

## 🔄 Development Workflow

The workflow we follow throughout the course for every feature:

1. **Document** — Write the feature spec in `context/current-feature.md`
2. **Branch** — Create a new branch (`feature/[name]` or `fix/[name]`)
3. **Implement** — Build the feature with AI assistance
4. **Create Tests** - Create unit tests for server actions
5. **Run Tests** — Verify in the browser, run `npm run build` and `npm run test`
6. **Iterate** — Adjust as needed
7. **Commit** — Only after the build passes
8. **Merge** — Merge to main
9. **Delete Branch** — Clean up after merge
10. **Review** — Review AI-generated code
11. **Complete** — Mark as done in `current-feature.md`

---

## 🎓 Course Curriculum

15 sections with 100+ lessons covering the full development lifecycle.

### Section 1 — Welcome to the Course (7 lessons)

Introduction to AI-assisted development, the current landscape, different levels of AI assistance, and common AI tools.

### Section 2 — Vibe Coding for Prototyping (7 lessons)

Learn rapid prototyping with AI — writing good prompts, iterating on output, and understanding the gap between prototypes and production code.

### Section 3 — Claude Code Setup & Context Tokens (7 lessons)

Claude Code overview, installation, plan mode, slash commands, context management, and the VS Code extension.

### Section 4 — Project Planning & Context Files (5 lessons)

Planning a project with AI, creating a project spec, setting up `CLAUDE.md`, coding standards, and the AI workflow.

### Section 5 — Start Building DevStash (7 lessons)

Initialize the project, create a quick prototype, set up mock data, and build the dashboard UI in three phases.

### Section 6 — Database Integration & Initial Deploy (9 lessons)

Set up Neon PostgreSQL, configure Prisma 7, run migrations, seed data, populate the dashboard, and deploy to Vercel.

### Section 7 — Skills & Subagents (8 lessons)

Create custom Claude Code skills (feature, cleanup, research, list-components) and subagents (code scanner, UI reviewer).

### Section 8 — Working with MCP Servers (4 lessons)

What is MCP, setting up Neon MCP, Context7, and Playwright MCP for automated testing.

### Section 9 — Implement Authentication (12 lessons)

NextAuth v5 in three phases, GitHub OAuth, email verification with Resend, forgot password, user profile, rate limiting with Upstash.

### Section 10 — Item CRUD, Research & Unit Testing (9 lessons)

Custom research skill, item listings, unit testing, item details drawer, edit/delete/create operations, and Playwright E2E tests.

### Section 11 — Item Display & R2 Storage (8 lessons)

Code editor, markdown editor, Cloudflare R2 setup, file/image uploads, display components, and code scanning.

### Section 12 — Collections, Search, Favorites & More (11 lessons)

Collection CRUD, adding items to collections, global search with command palette, pagination, settings, favorites, and pinned items.

### Section 13 — Home & Stripe Integration (13 lessons)

Homepage design and implementation, UI reviewer subagent, Stripe sandbox setup, integration plan, implementation in two phases, webhooks, and production testing.

### Section 14 — Implement AI Features (5 lessons)

OpenAI integration, auto-tagging, AI summaries, code explanation, and prompt optimization.

### Section 15 — Code Audit & Final Deployment (5 lessons)

UI review, refactoring reusable utilities, domain setup, Resend domain validation, and course wrap-up.

---

## 📁 Folder Structure

```
coding-with-ai-course-resources/
├── course-lessons/          # Lesson notes for all 15 sections
├── prompts/                 # Prompts used in each section
├── context/                 # Project context files (specs, features, research)
├── docs/                    # Detailed project documentation
├── skills/                  # Custom Claude Code skills
├── custom-subagents/        # AI subagent definitions
├── legacy-custom-commands/  # Older custom command format (pre-skills)
├── diagrams-notes/          # Visual diagrams used in lessons
├── ai-tool-equivilents.md   # AI tool feature equivalents & comparisons
├── CLAUDE.md                # Claude Code project instructions
└── README.md
```

### `/course-lessons`

Lesson notes organized by section. Each file covers a single lesson with explanations, steps, and key concepts.

### `/prompts`

The actual prompts used throughout the course, organized by section. Use these as reference when following along or to see examples of effective AI prompting.

| File                           | Section                          |
| ------------------------------ | -------------------------------- |
| `prototype-example-prompts.md` | Example prototyping prompts      |
| `section-02-prompts.md`        | Vibe Coding for Prototyping      |
| `section-03-prompts.md`        | Claude Code Setup                |
| `section-04-prompts.md`        | Project Planning & Context Files |
| `section-05-prompts.md`        | Start Building DevStash          |
| `section-06-prompts.md`        | Database & Deployment            |
| `section-07-prompts.md`        | Skills & Subagents               |
| `section-08-prompts.md`        | MCP Servers                      |
| `section-09-prompts.md`        | Authentication                   |
| `section-10-prompts.md`        | Item CRUD & Testing              |
| `section-11-prompts.md`        | Item Display & R2 Storage        |
| `section-12-prompts.md`        | Collections, Search & More       |
| `section-13-prompts.md`        | Home & Stripe                    |
| `section-14-prompts.md`        | AI Features                      |
| `section-15-prompts.md`        | Code Audit & Deployment          |

### `/context`

The project context files used by Claude Code during development. These are the files that live in the DevStash repo and guide AI behavior.

- **Root files** — `project-overview.md`, `coding-standards.md`, `ai-interaction.md`, `current-feature.md`
- **`/features`** — Individual feature specs (30+ files covering auth, dashboard, items, collections, AI, etc.)
- **`/fixes`** — Fix specifications (e.g., GitHub OAuth redirect fix)
- **`/research`** — Technical research docs (AI integration, item CRUD patterns, Stripe)
- **`/screenshots`** — UI mockups and design references

### `/docs`

Detailed project documentation and architecture plans:

| File                         | Description                                    |
| ---------------------------- | ---------------------------------------------- |
| `project-spec.md`            | Master project specification                   |
| `item-types.md`              | All 7 system item types with field definitions |
| `item-crud-architecture.md`  | CRUD operation architecture                    |
| `stripe-integration-plan.md` | Stripe payment integration plan                |
| `ai-integration-plan.md`     | AI features integration plan                   |

### `/skills`

Custom Claude Code skills created during the course:

| Skill              | Description                                                                                 |
| ------------------ | ------------------------------------------------------------------------------------------- |
| `feature/`         | Feature implementation workflow with actions (load, start, review, explain, complete, test) |
| `cleanup/`         | Code cleanup and file removal                                                               |
| `research/`        | Technical research documentation                                                            |
| `list-components/` | List and catalog all components in a codebase                                               |

### `/custom-subagents`

Specialized AI subagent definitions:

| Subagent              | Description                                              |
| --------------------- | -------------------------------------------------------- |
| `code-scanner.md`     | Scans for code quality, performance, and security issues |
| `ui-reviewer.md`      | Reviews UI/UX against design specifications              |
| `refactor-scanner.md` | Identifies refactoring opportunities                     |

### `/diagrams-notes`

Visual diagrams used in lesson slides — levels of AI assistance, prototyping, context & tokens, migrations workflow, MCP architecture, and more.

### `/legacy-custom-commands`

The older custom command format (before Claude Code skills were introduced). Kept for reference.

---

## 🔀 AI Tool Equivalents

The course uses **Claude Code** as the primary AI tool, but all major concepts transfer to other tools. See [`ai-tool-equivilents.md`](ai-tool-equivilents.md) for a full comparison covering:

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Project context** | `CLAUDE.md` | `.cursor/rules/*.mdc` | `GEMINI.md` | `AGENTS.md` | `.windsurfrules` |
| **Custom commands** | `.claude/commands/` | `.cursor/commands/` | `.gemini/commands/` | Built-in `/` commands | Workflows (`.md`) |
| **Skills** | `.claude/skills/` | — | `.gemini/skills/` | `.agents/skills/` | — |
| **Subagents** | `.claude/agents/` | — | `.gemini/agents/` | `config.toml` | Cascade parallel |
| **MCP servers** | `claude mcp add` | `.cursor/mcp.json` | `settings.json` | `~/.codex/config.toml` | Settings UI |
| **Hooks** | `settings.json` | — | — | Partial | — |
| **Headless mode** | `claude -p` | — | `gemini -p` | `codex exec` | — |

The guide also covers agent mode, parallel agents, session resume, model selection, IDE integration, and pricing.

---

## 🛠️ Course Project Tech Stack

| Category     | Technology                   |
| ------------ | ---------------------------- |
| Framework    | Next.js (React 19)           |
| Language     | TypeScript (strict mode)     |
| Database     | Neon PostgreSQL + Prisma ORM |
| Auth         | NextAuth v5 (Email + GitHub) |
| Styling      | Tailwind CSS v4 + shadcn/ui  |
| File Storage | Cloudflare R2                |
| AI           | OpenAI GPT-5-Nano            |
| Payments     | Stripe                       |
| Deployment   | Vercel                       |
| Main AI Tool | Claude Code (Opus 4.5/4.6)   |

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
