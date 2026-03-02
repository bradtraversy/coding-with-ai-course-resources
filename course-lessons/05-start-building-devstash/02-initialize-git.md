# Git & GitHub Setup & Workflow

Before we start building features, let's set up Git and GitHub. You can use regular commands, a Git GUI or just talk to the AI and have it do all your Git stuff.


## Initialize Git

We bootstrapped our Next.js app, now let's initialize git:

```bash
git init
```

The AI will always be able to see and interact with Git. For instance, we can say:

```text
What is the status of Git?
```

It will show us. We can also have it run Git commands:

```
Add all untracked files to staging
```

So it will run `git add .`

Then you could say something like:

```text
Commit all files and push with the message "chore: initial Next.js setup and context files"
```

Of course, we can still do things manually like this:

```bash
git commit -m "chore: initial Next.js setup and context files"
```

## Create A GitHub Repo

Go to https://github.com and create a new repository. Copy the `git remote` command and add it as your remote repo. You can run the command or you could just tell the AI to add it.

Once you add the remote repo, run the following prompt:

```text
Make sure all files are commited, then push to the remote repo
```

It will run `git push` and you should be all set.

