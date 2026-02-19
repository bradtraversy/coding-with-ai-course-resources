# Code Scan

We are in good shape up to this point. I just want to run a scan/audit and see if there are any issues we could fix or optimize.

## Clean Up

Let's start by running our `cleanup` command/skill. This will look for things like unused imports.

Run `/cleanup`

## Code Scanner

Let's run the following prompt:

```text
Use the code scanner to audit the codebase and look for things like security issues, optimizations, duplicate code, etc. Try not to report things that are jus not implemented yet or false positives.
```

Depending on what you get, use your best judgement to fix or optimize. Be sure to open a new branch before making changes.

## Optimization

Run the following:

```text
Check for areas where we can split up large bunches of code and create separate functions or components
```