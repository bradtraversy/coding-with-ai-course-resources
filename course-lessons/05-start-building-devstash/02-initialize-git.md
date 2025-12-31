# Git & GitHub Setup & Workflow

Before we start building features, let's set up Git and GitHub. Claude Code integrates nicely with both, especially when you have the GitHub CLI (gh) installed. With the CLI installed, we can have Claude do things like check issues. We will set this up later. For now, let's create a new repo.

## Initialize Git

We bootstrapped our Next.js app, now let's initialize git:

```bash
git init
```

The AI will always be able to see and interact with Git. For instance, we can say:

```text
Tell me which files are staged and untracked right now
```

It will show us. We can also have it run Git commands:

```
Add all untracked files to staging
```

So it will run `git add .`

Of course, we can still do things manually. Let's add all files to the staging area:

```bash
git commit -m "chore: initial Next.js setup and context files"
```

Now we have version control from the start. We won't create our remote repo just yet. I want to do that using the CLI, which we will look at in a little bit.
