# AI Coding Tools: Feature Equivalents & Comparisons

> **For the "Coding with AI" course** — This guide maps Claude Code features to their equivalents in Cursor, Gemini CLI, OpenAI Codex CLI, and Windsurf so students can follow along regardless of which tool they use.

---

## Table of Contents

1. [Context / Memory Files](#1-context--memory-files)
2. [Slash Commands](#2-slash-commands)
3. [Skills](#3-skills)
4. [Subagents](#4-subagents)
5. [MCP (Model Context Protocol)](#5-mcp-model-context-protocol)
6. [Hooks / Lifecycle Events](#6-hooks--lifecycle-events)
7. [Plugins / Extensions](#7-plugins--extensions)
8. [Agentic / Agent Mode](#8-agentic--agent-mode)
9. [Multi-Agent / Parallel Agents](#9-multi-agent--parallel-agents)
10. [Headless / Scripting Mode](#10-headless--scripting-mode)
11. [Session Resume / Checkpointing](#11-session-resume--checkpointing)
12. [Built-in Tools](#12-built-in-tools)
13. [Model Selection](#13-model-selection)
14. [IDE Integration](#14-ide-integration)
15. [Quick Reference Cheat Sheet](#quick-reference-cheat-sheet)

---

## 1. Context / Memory Files

The "always-on" instructions file that shapes how the AI behaves across every session in your project — coding standards, preferred frameworks, naming conventions, etc.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Project context file** | `CLAUDE.md` | `.cursor/rules/*.mdc` | `GEMINI.md` | `AGENTS.md` | `.windsurfrules` |
| **Global (all projects)** | `~/.claude/CLAUDE.md` | User-level Rules in settings | `~/.gemini/GEMINI.md` | `~/.codex/AGENTS.md` | Global Memories |
| **Hierarchical (per-folder)** | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Auto-loaded every session** | ✅ | ✅ | ✅ | ✅ | ✅ |

### How Each Tool Handles It

**Claude Code — `CLAUDE.md`**
Define project conventions, preferred stack, and instructions once. Claude loads the global `~/.claude/CLAUDE.md` into every conversation, plus any `CLAUDE.md` found in the project folder. Keep it concise — only include what's always true about the project.

**Cursor — `.cursor/rules/*.mdc`**
Cursor evolved from a single `.cursorrules` file (2024) to a directory of granular `.mdc` rule files (early 2025). Each `.mdc` file can be scoped to specific file types or folders, giving fine-grained control per context.

**Gemini CLI — `GEMINI.md`**
Uses a hierarchical system — it loads `GEMINI.md` files from the global home directory, the project root, and sub-directories, concatenating them all. More specific (deeper) files override general ones. Use `/memory show` to inspect what's currently loaded, `/memory refresh` to reload, and `/memory add <text>` to append persistent notes on the fly.

**Codex CLI — `AGENTS.md`**
Walks from the project root down to your current directory, merging files so deeper files override earlier guidance. You can also create `AGENTS.override.md` for temporary overrides without touching the base file. Configure custom fallback filenames in `~/.codex/config.toml` if your repo uses a different naming convention.

**Windsurf — `.windsurfrules`**
Rules define how the Cascade agent behaves within a project. Windsurf also has a persistent **Memories** system that learns your coding style, APIs, and preferences over time across sessions — going beyond a static rules file.

---

## 2. Slash Commands

Reusable, user-triggered workflow shortcuts. You type `/command` to kick off a pre-defined prompt or workflow instead of writing it from scratch every time.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Slash commands** | ✅ | ✅ | ✅ | ✅ | ✅ (Workflows) |
| **Custom commands** | `.claude/commands/*.md` | `.cursor/commands/` | `.gemini/commands/` | Built-in `/` commands | Named Workflows as `.md` |
| **Global commands (all projects)** | `~/.claude/commands/` | User-level | `~/.gemini/commands/` | `~/.codex/` | Global settings |
| **Auto-complete / discovery** | ✅ `/help` lists all | ✅ | ✅ | ✅ | ✅ |
| **Can trigger subagents** | ✅ | N/A | ✅ | ✅ | N/A |

### Key Built-in Commands

| Purpose | Claude Code | Gemini CLI | Codex CLI |
|---|---|---|---|
| Help / list commands | `/help` | `/help` | `/help` |
| Clear screen | `/clear` | `/clear` | `/clear` |
| Show memory/context | `/memory` | `/memory show` | N/A |
| List agents | `/agents` | N/A | N/A |
| List skills | `/skills` | N/A | `/skills` |
| Review mode | N/A | N/A | `/review` |
| Model switcher | N/A | N/A | `/model` |
| Show stats/quota | N/A | `/stats` | N/A |

### Creating Custom Commands

All CLI tools follow a similar pattern — create a markdown file with your prompt:

```markdown
<!-- Claude Code: .claude/commands/review.md -->
<!-- Gemini CLI: .gemini/commands/review.md -->

Review the current file for:
1. Security vulnerabilities
2. Missing error handling
3. Test coverage gaps

Return a prioritized list with suggested fixes.
```

**Windsurf** uses the same concept under the name **Workflows**:

```markdown
<!-- .windsurf/workflows/deploy-check.md -->
Before deploying, run the following steps:
1. Run all tests
2. Check for console.log statements
3. Verify environment variables
```

---

## 3. Skills

Auto-invoked capability packages. Unlike slash commands (which you trigger manually), skills are loaded automatically when the agent determines your task matches the skill's description. Uses progressive disclosure — only metadata is loaded initially; full instructions are pulled in on demand to save context.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Skills** | ✅ `.claude/skills/` | ❌ | ✅ `.gemini/skills/` | ✅ `.agents/skills/` | ❌ (Cascade context covers this) |
| **Auto-invocation** | ✅ (description match) | ❌ | ✅ (description match) | ✅ (implicit + explicit) | N/A |
| **Explicit invocation** | `@skill-name` or via slash command | N/A | N/A | `$skill-name` in prompt | N/A |
| **Progressive disclosure** | ✅ | N/A | ✅ | ✅ | N/A |
| **Shared open standard** | Anthropic standard | — | ✅ (same standard) | ✅ (same standard) | — |

### Skill File Structure

Skills use YAML frontmatter to describe when to invoke them, followed by instructions:

```markdown
<!-- Claude Code: .claude/skills/code-review/SKILL.md -->
<!-- Gemini CLI: .gemini/skills/code-review/SKILL.md -->
<!-- Codex: .agents/skills/code-review/SKILL.md -->

---
name: code-review
description: Perform a thorough code review when the user asks to review, audit, or check code quality.
---

# Code Review Skill

When reviewing code:
1. Check for security vulnerabilities
2. Identify performance bottlenecks
3. Verify error handling is in place
4. Confirm naming conventions are followed
5. Suggest missing tests
```

> **Note:** Claude Code, Gemini CLI, and Codex CLI all support the same Agent Skills open standard, meaning skills can be portable across tools.

---

## 4. Subagents

Specialized, isolated agent instances with their own context windows. Useful for parallel work, domain-specific tasks, and keeping your main conversation context clean.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Subagents** | ✅ `.claude/agents/*.md` | ❌ (single agent) | ✅ `.gemini/agents/*.md` | ✅ `[agents]` in `config.toml` | ✅ (parallel Cascade sessions, Wave 13+) |
| **Isolated context window** | ✅ | ❌ | ✅ | ✅ | Partial |
| **Parallel execution** | ✅ | ❌ | ✅ (experimental) | ✅ | ✅ (newer) |
| **Custom system prompts** | ✅ | ❌ | ✅ | ✅ | N/A |
| **Tool restrictions per agent** | ✅ Allowlist / denylist | ❌ | ❌ | ❌ | ❌ |
| **Auto-invoked by description** | ✅ | N/A | ✅ | ✅ | N/A |

### Subagent File Structure

```markdown
<!-- Claude Code: .claude/agents/code-reviewer.md -->

---
name: code-reviewer
description: Reviews code for quality, security, and best practices. Use when asked to review, audit, or assess code.
tools: Read, Glob, Grep
model: sonnet
---

You are a strict code reviewer.
Focus on security, performance, and maintainability.
Always suggest concrete improvements with examples.
```

```markdown
<!-- Gemini CLI: .gemini/agents/security-auditor.md -->

---
name: security-auditor
description: Analyze code for security vulnerabilities. Invoke when asked to audit, scan, or check for security issues.
---

You are a security-focused code auditor.
Check for OWASP Top 10 vulnerabilities.
Flag any hardcoded credentials or unsafe patterns.
```

### Claude Code Built-in Subagents

Claude Code ships with built-in subagents you can reference:

| Subagent | Purpose |
|---|---|
| `claude-code-guide` | Answers questions about Claude Code itself |
| General agent (Task tool) | Spawns a clone of the main agent for parallel work |

---

## 5. MCP (Model Context Protocol)

Connects your AI tool to external services — databases, APIs, GitHub, Slack, Figma, browsers, and more. Think of it as a universal adapter (like USB-C) for AI tools. Introduced by Anthropic in November 2024, now widely adopted across all major tools.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **MCP support** | ✅ (foundational) | ✅ | ✅ | ✅ | ✅ |
| **Config location** | `claude mcp add` / `settings.json` | `.cursor/mcp.json` | `settings.json` | `~/.codex/config.toml` | Settings UI |
| **Per-subagent MCP config** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Tool limit** | No hard limit | 40-tool limit | No hard limit | No hard limit | No hard limit |
| **One-click curated installs** | ❌ (CLI-first) | ✅ | ✅ (extensions) | ❌ | ✅ |

### Adding an MCP Server

```bash
# Claude Code
claude mcp add playwright npx @playwright/mcp@latest
claude mcp add github npx @modelcontextprotocol/server-github

# Gemini CLI (via extensions)
gemini extensions install https://github.com/browserbase/mcp-server-browserbase

# Codex CLI
codex mcp add github -- npx @modelcontextprotocol/server-github
```

Once added, MCP tools appear as slash commands:

```
# Claude Code
/mcp__playwright__create-test

# Use @ to reference MCP resources in Gemini CLI
@github-issues
```

---

## 6. Hooks / Lifecycle Events

Inject custom shell commands, HTTP calls, or prompts at specific points in the agent's execution cycle. Useful for automated quality gates, notifications, and deterministic checks.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Hooks / lifecycle events** | ✅ Full hook system | ❌ | ❌ | Partial (commit hooks) | ❌ |
| **Pre/post tool execution** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **File change triggers** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Notification hooks** | ✅ | ❌ | ❌ | ❌ | ❌ |

### Claude Code Hook Types

| Hook | When it fires |
|---|---|
| `PreToolUse` | Before any tool call (Read, Write, Bash, etc.) |
| `PostToolUse` | After a tool call completes |
| `Notification` | When Claude needs your attention |
| `Stop` | When the agent finishes a task |

### Hook Example

```json
// .claude/settings.json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "npm run lint -- --fix $CLAUDE_TOOL_INPUT_PATH"
          }
        ]
      }
    ]
  }
}
```

> **For Cursor/Windsurf users:** Hooks don't have a direct equivalent. The closest workaround is using IDE-level file watchers, pre-commit git hooks, or VSCode tasks that run on save.

---

## 7. Plugins / Extensions

Bundled packages that distribute a complete set of subagents, skills, commands, and MCP servers as a single installable unit. Ideal for team standardization.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Plugin / extension system** | ✅ Plugins | ✅ Extensions marketplace | ✅ Extensions | ✅ Plugin system | ✅ Extensions |
| **Bundles agents + skills + commands** | ✅ | Partial | ✅ | ✅ | Partial |
| **Install command** | `claude plugins install` | Extensions panel | `gemini extensions install <url>` | Via plugin system | Extensions panel |
| **Share across teams** | ✅ | ✅ | ✅ | ✅ | ✅ |

### Gemini CLI Extension Example

```bash
# Install a community extension that adds Conductor workflow planning
gemini extensions install https://github.com/gemini-cli-extensions/conductor

# Use it
/conductor:plan   # Creates a spec/plan before coding
/conductor:implement  # Works through the plan step by step
```

---

## 8. Agentic / Agent Mode

The core autonomous coding mode where the AI can read files, write code, run commands, and take multi-step actions without you manually directing each step.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Agentic mode** | ✅ Default mode | ✅ Agent Mode | ✅ Default (ReAct loop) | ✅ Default Agent mode | ✅ Cascade (Write mode) |
| **File system access** | ✅ Full | ✅ Editor-scoped | ✅ Full | ✅ Full | ✅ Full |
| **Run terminal commands** | ✅ | ✅ | ✅ (interactive PTY) | ✅ | ✅ (Turbo Mode) |
| **Plan before executing** | ✅ (extended thinking) | ✅ Plan Mode | ✅ | ✅ | ✅ Plan Mode (Wave 13) |
| **Approval controls** | ✅ Permission modes | ✅ Auto-approve toggle | ✅ Policy engine | ✅ `--ask-for-approval` | ✅ Turbo Mode toggle |
| **Diff preview** | ✅ | ✅ | ✅ (inline) | ✅ | ✅ |

### Permission / Approval Modes

**Claude Code:**
```bash
claude --permission-mode ask        # Ask before every action
claude --permission-mode accept-edits  # Auto-accept file edits
claude --permission-mode bypass-perms  # Full auto (use carefully)
```

**Codex CLI:**
```bash
codex --ask-for-approval on-request  # Interactive mode
codex --ask-for-approval never       # Fully autonomous
codex --yolo                         # Bypass all approvals (hardened env only)
```

---

## 9. Multi-Agent / Parallel Agents

Running multiple agents simultaneously — each working on different parts of a task — then combining their results.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Parallel agents** | ✅ Agent Teams | ❌ (single agent) | ✅ (experimental A2A) | ✅ Multi-agent workflows | ✅ (Wave 13+, Git worktrees) |
| **Shared task list** | ✅ | N/A | ✅ | ✅ | ✅ |
| **Agent-to-Agent protocol** | ✅ | N/A | ✅ A2A (experimental) | ✅ Hand-offs | N/A |
| **Coordinator pattern** | ✅ | N/A | ✅ | ✅ | N/A |

### Claude Code Agent Teams Pattern

```markdown
<!-- .claude/agents/coordinator.md -->
---
name: coordinator
description: Coordinates work across the backend and frontend agents for feature development.
tools: Agent(backend-dev, frontend-dev), Read, Bash
---

You coordinate feature development.
Delegate backend work to the backend-dev agent.
Delegate UI work to the frontend-dev agent.
Combine and review their output before presenting it.
```

**Codex parallel fan-out example:**
```bash
# Fan out work from a CSV across multiple agents
codex exec "spawn_agents_on_csv tasks.csv"
```

---

## 10. Headless / Scripting Mode

Running the AI tool non-interactively in scripts, CI/CD pipelines, and automation workflows.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Headless / non-interactive mode** | ✅ `claude -p "prompt"` | ❌ | ✅ `gemini -p "prompt"` | ✅ `codex exec "prompt"` | ❌ |
| **JSON output** | ✅ `--output-format json` | N/A | ✅ `--output-format json` | ✅ | N/A |
| **Pipe-friendly** | ✅ | N/A | ✅ | ✅ | N/A |
| **CI/CD ready** | ✅ | ❌ | ✅ (GitHub Actions) | ✅ (GitHub Actions) | ❌ |

### Scripting Examples

```bash
# Claude Code — run in parallel across directories
for dir in services/*/; do
  claude -p "Add input validation to all API endpoints" --dir "$dir" &
done

# Gemini CLI — headless with JSON output
gemini -p "Explain this codebase architecture" --output-format json

# Codex CLI — automate and resume
codex exec "Fix all TypeScript errors in src/"
codex exec resume --last "Now add JSDoc comments to the fixed files"
```

---

## 11. Session Resume / Checkpointing

Saving and resuming conversations so you can pick up exactly where you left off without re-explaining context.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Session resume** | ✅ `claude --resume` | ✅ (chat history) | ✅ `/chat` + checkpoints | ✅ `codex resume` | ✅ (persistent Flows) |
| **Named sessions** | ✅ | ✅ | ✅ `/chat save <name>` | ✅ session IDs | ✅ |
| **Full state preserved** | ✅ | ✅ | ✅ | ✅ (incl. approvals) | ✅ |
| **Browse past sessions** | ✅ | ✅ | ✅ | ✅ picker UI | ✅ |

```bash
# Claude Code
claude --resume           # Pick from recent sessions
claude --resume <id>      # Resume specific session

# Gemini CLI
/chat save my-feature     # Save with a name
/chat list                # Browse saved sessions
/chat resume my-feature   # Resume by name

# Codex CLI
codex resume              # Interactive picker
codex resume --last       # Jump straight to most recent
codex resume <session-id> # Target a specific session
```

---

## 12. Built-in Tools

The core file, shell, and search capabilities the agent can use natively without MCP.

| Tool | Claude Code | Gemini CLI | Codex CLI | Windsurf Cascade |
|---|---|---|---|---|
| **Read files** | ✅ `Read` | ✅ | ✅ | ✅ |
| **Write files** | ✅ `Write` / `Edit` | ✅ | ✅ | ✅ |
| **Run shell commands** | ✅ `Bash` | ✅ (interactive PTY) | ✅ `!command` prefix | ✅ (Turbo Mode) |
| **Search files** | ✅ `Grep`, `Glob` | ✅ | ✅ | ✅ |
| **Web search** | ✅ (via MCP or built-in) | ✅ (Google Search grounded) | ✅ | ✅ |
| **Web fetch** | ✅ | ✅ | ✅ | ✅ |
| **Browser / web automation** | ✅ (via MCP Playwright) | ✅ Browser agent (experimental) | ✅ (via MCP) | ✅ Live preview |
| **Image input** | ✅ | ✅ | ✅ | ✅ |

---

## 13. Model Selection

Which AI models each tool supports and how you switch between them.

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **Models available** | Claude only (Sonnet, Opus, Haiku) | GPT, Claude, Gemini, Composer | Gemini models only | GPT / Codex models | GPT, Claude, Gemini, SWE-1 |
| **Switch models** | `--model` flag | Dropdown in UI | `/settings` or config | `/model` command or `config.toml` | Model dropdown |
| **Extended thinking** | ✅ Opus (default on) | Depends on model | ✅ | Depends on model | Depends on model |
| **Per-subagent model** | ✅ | N/A | ✅ | N/A | N/A |
| **Context window** | 200K (1M beta on Opus) | 200K (reported ~70-120K usable) | 1M | Varies by model | 200K+ |

---

## 14. IDE Integration

| Feature | Claude Code | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| **VS Code extension** | ✅ | Built-in (fork) | ✅ (Code Assist) | ✅ | ✅ |
| **JetBrains** | ✅ | ❌ | ✅ | ❌ | ✅ |
| **Desktop app** | ✅ | ✅ (is the IDE) | ❌ | ✅ | ✅ (is the IDE) |
| **Terminal / CLI** | ✅ Primary | ✅ (Cursor CLI, Jan 2026) | ✅ Primary | ✅ Primary | Partial |
| **Inline diff view** | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Tab completion** | ❌ | ✅ (Supermaven) | ✅ | ❌ | ✅ (Supercomplete) |

---

## Quick Reference Cheat Sheet

| Claude Code Concept | What it does | Cursor | Gemini CLI | Codex CLI | Windsurf |
|---|---|---|---|---|---|
| `CLAUDE.md` | Always-on project instructions | `.cursor/rules/*.mdc` | `GEMINI.md` | `AGENTS.md` | `.windsurfrules` |
| **Slash commands** | User-triggered reusable workflows | Slash commands / Commands | Custom commands | `/` commands | Workflows |
| **Skills** | Auto-invoked capability packages | ❌ | Agent Skills | Agent Skills | ❌ |
| **Subagents** | Isolated specialist agents | ❌ | Subagents (experimental) | Multi-agent | Cascade parallel (Wave 13+) |
| **MCP servers** | External tool integrations | MCP (40-tool limit) | Extensions / MCP | MCP | MCP |
| **Hooks** | Lifecycle event triggers | ❌ | ❌ | Commit hooks (partial) | ❌ |
| **Plugins** | Bundled shareable packages | Extensions | Extensions | Plugin system | Extensions |
| **Headless mode** | Scripting / CI/CD usage | ❌ | `gemini -p` | `codex exec` | ❌ |
| **Agent Teams** | Coordinated parallel agents | ❌ | A2A (experimental) | Multi-agent hand-offs | Parallel Cascade (Wave 13+) |
| **Session resume** | Pick up where you left off | Chat history | `/chat resume` | `codex resume` | Persistent Flows |

---

## Pricing Overview (as of early 2026)

| Tool | Entry Price | Heavy Usage |
|---|---|---|
| **Claude Code** | $20/mo (Pro) | $100–200/mo (Max plans) |
| **Cursor** | $20/mo (Pro) | $60/mo (Pro+) / $200/mo (Ultra) |
| **Gemini CLI** | Free (with Gemini API key) | Pay-as-you-go via Gemini Code Assist |
| **Codex CLI** | Included with ChatGPT Plus ($20/mo) | Included with ChatGPT Pro ($200/mo) |
| **Windsurf** | Free tier available | $15/mo (Pro) — cheapest paid option |

---

## Key Takeaways for Students

1. **`CLAUDE.md` → `GEMINI.md` / `AGENTS.md` / `.cursor/rules/` / `.windsurfrules`** — Every tool has a version of this. It's the most transferable concept.

2. **Slash commands are universal.** All tools support custom slash commands defined as markdown files. Same concept, slightly different folder paths.

3. **Skills are a shared open standard.** Claude Code, Gemini CLI, and Codex CLI all support the Agent Skills standard — skills created for one may work in another.

4. **MCP is universal.** Every major tool now supports MCP. Learn it once; it transfers everywhere.

5. **Subagents / parallel execution** is where Claude Code still leads. Cursor has no equivalent; Gemini CLI and Codex CLI have it in various experimental stages.

6. **Hooks are Claude Code-exclusive.** There's no equivalent in other tools yet — it's a key differentiator for automation power users.

7. **Windsurf and Cursor are IDE-first.** They shine for day-to-day editing with tab completion and visual diffs. Claude Code, Gemini CLI, and Codex CLI are terminal-first and better for autonomous, large-scale tasks.

---

*Last updated: March 2026*