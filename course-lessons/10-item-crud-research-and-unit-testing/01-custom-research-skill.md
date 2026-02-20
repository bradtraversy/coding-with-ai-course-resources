# Custom Research Skill

Now we want to start building our content library and working with items of different types. The snippets, notes, commands and so on.

Each item type has a different use and has some custom fields that differe from other types. What I want to do is create a new skill/command called `/research`, which will take in a research file, much like the `/feature` command takes in a spec file.

So `/feature` is to create code and `/research` is to create documentation. And when I say documentation, I mostly mean for you not for the AI or context. For you and any team members that work on the project. You can create context docs, but the default location of the output of the command will be in the `docs` folder. Which is mainly meant for people working on the project.

## Create the Command/Skill

Copy the file `.claude/skills/research/SKILL.md` from the course files to your project's skills folder. Open it and take a look at it.

The content types information is one document I want to create. Then I want to create a CRUD strategy for the types. 

## Content Type Research

Open your course files and move `context/research/item-types-research.md` to your own project's `context/research` folder.

Now, you can run the following:

```
/research item-types-research.md
```

This will then output comprehensive documentation about the types to `docs/item-types.md`. Take a look at it.

## Item CRUD Research

Now do the same for CRUD research. Move the file `context/research/item-crud-research.md` from your course files to your project and run the following:

```
/research item-crud-research.md
```

Then take a look at the documentation. This is great to have, especially if you have team members that need to understand the project.

Now we can move on to implementing CRUD.
