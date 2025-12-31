## GitHub CLI Setup

Now we want to integrate Claude with Github directly by using the **GitHub CLI (gh)**. This let's Claude do things like create repos, push code, create PRs, and easily integrate actions.

## Install GitHub CLI

Mac:

```bash
brew install gh
```

Windows:

```bash
winget install gh
```

Or download from https://cli.github.com/

## Authenticate

Authenticate with the following command:

```bash
gh auth login
```

If you are on Windows, you may have issues using the `gh` command in Git Bash as well as using it within VS Codes integrated terminal. I would suggest using the standard terminal in it's own window.

Follow the prompts to authenticate with your GitHub account. Use either HTTPS or SSH.

## Create a GitHub Repo

Now let's push our project to GitHub.

Make sure your local repo is up to date:

```bash
git status
```

If not:

```bash
git add . && git commit -m 'Update'
```

Since we have the CLI setup, you can ask Claude:

```text
Create a GitHub repo called devstash and push this project
```

Claude will run something like:

```bash
gh repo create devstash --private --source=. --push
```

And just like that, your project is on GitHub

## Our Git Workflow

Throughout this course, we'll follow this workflow:

- New Branch - Best to create a new branch for features, fixes, etc
- Build - Implement the feature with Claude
- Test - Verify it works in the browser
- Validate - Run npm run build and fix any errors
- Commit - Ask Claude to commit the changes
- Merge - Merge to main branch
- Push - Push to GitHub
- Delete Branch - I like to delete branches right after I push

If you are working on a team, you would most likely make a PR instead of pushing directly.

## Other Useful GitHub Commands

Once you have gh set up, you can ask Claude to:

- "Show me open issues"
- "Create an issue for this bug"
- "Create a PR for these changes"
- "What's the status of my PR checks?"

We'll use some of these later in the course.

## `/install-github-app` Command

We can use this command to setup Github actions for Claude Code. This is for CI/CD integration, where Claude can:

- Automatically respond to PR comments
- Run code reviews on PRs
- Respond to issues

This is more for team projects and large open-source projects. It can be useful for solo private projects, but I'm going to skip it for now. Maybe we'll find a use for it later.

Now that we have Git and Github setup, let's start working on our dashboard.
