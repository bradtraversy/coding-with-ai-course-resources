# Course Resource Files

Throughout the whole course, you'll hear me reference the course files or resource files. All of that can be found right here in this repository. I'll have a document with all the links in this section. I'll also try and include the relevant files in that video lesson.

Try not to get overwhelmed here because there is a lot. I'm going to kind of shoot a bunch of stuff at you now but we go through very slowly and implement and use these files in a way where it will make much more sense to you later.


### `/course-lessons`

These are all the supporting files for the course. The first folder I want to show you is the course lessons. This is basically a written version of the entire course front to back. So you can use these as a supplement with the videos. I usually call these the premium docs in my other courses.

### `/diagrams-notes`

This is all the excalidraw documents and diagrams that I use in the course exported as png images. So if you want these for yourself, you can find them here.

### `/context`

The context folder has a few things. In simple terms, context refers to what the AI has in memory. So the files directly in this folder will actually be loaded when the AI, in my case, Claude Code, starts up. So things like how I want the model to interact with me, the coding standards we should use, the project overview and one of the most important files we'll be using constantly and that is the `current-feature.md` file. We will be updating this before and after just about everything we do once we get into our workflow.


#### `/context/features`

In this course, we use a specific workflow to add features and that workflow includes creating or using a feature spec file. We'll use straight prompts for some simple stuff and in the beginning to prototype, but typically we'll be loading info from these feature spec files into the current feature and then implementing it. We'll have a custom `/features` command or skill to load these files up and do different things like start, test, review, etc.

#### `/context/fixes`

This will be fixes that we add to the current feature to implement.

#### `/context/research`

The research folder is for research files for creating or generating documentation. For instance, we have documentation generated for the auth integration, crud, stripe and ai integration. Basically any really large part of the project. We'll have a `/research` command to load these.

#### `/context/screenshots`

This is just screenshots that we use for the UI

### `/skills`

As I mentioned, we will be creating custom commands. In Claude Code, these are now called skills. The most common skill or command we'll use is `/feature`. This will be used to go through our workflow to add and implement and test features. We also have a `/research` command to generate documentation. The `/cleanup` command is used for tasks like ordering the changelog, looking for unused files, etc. The `/list-component` is a simple one I created to introduce commands or skills. The `legacy-custom-commands` is just the older way we would implement slash commands before they were merged with skills.

### `custom-subagents`

In Claude Code and other agentic AI tools, you can create sub-agents. They may be called something else in other tools, but the idea is the same. You spawn these agents with their own context window to do certain tasks. We have agents mostly for code and UI auditing.

### `prompts`

As I mentioned, we mostly use research spec files to implement features not manual prompts, but the prompts we do use are in this folder. Some are kind of long so you can copy them here rather than type them out.

### `docs`

This is the folder that documentation generated with the `/research` command go. These are mostly meant for humans not for the AI.

### `CLAUDE.md`

This is the main context file for Claude Code. It loads whatever you put in here into the context window or memory on start.
