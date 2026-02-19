# Refactor Reusable Utils

I have noticed some code here and there that can probably be broken up a bit into utility functions or separate components. 

## Refactor Subagent

I want to use a refactor subagent, but rather than just give it to you, we will generate the agent file together. Run the following prompt:

```text
I want to create a subagent called "refactor-scanner" that takes in an argument of the folder to scan for duplicate code that can be put into seperate utility functions, components, etc. It should take in folders like actions, components, lib, api, hooks and all. Tailor the instructions to the type of folder/code
```

## Action Files Refactor

I want to start by just looking at the action files. Let's run the following prompt:

```text
Scan the actions folder for duplicate code and refactoring opportunities for utility functions
```

Use your best judgement here since your code will be different than mine.

## Component Refactor

Now let's check components:

```text
/clear

Scan the components folder for refactoring opportunities to break things up into smaller components. Also look for duplicate code
```

This process took a while for me. It is worth it though because it really cleaned things up.

