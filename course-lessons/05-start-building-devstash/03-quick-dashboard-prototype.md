# Our First Feature

Alright, so now we want to start to build our DevStash project. Remember we don't want to just to a one shot prompt, we work in phases.
I usually like to start with just the overall layout of the main area, which in this case will be the dashboard. We don't have to worry about the home or marketing page, authentication pages or anything like that. Let's just start with the dashboard UI.

## Quick Prototype

So we went over using vibe coding platforms for prototyping. I want to give that a shot and see if it gives me something I like. I don't to spend to much time on it. I just want a screenshot that we can use as a starting point.

This will give Claude a visual reference, which is much better than just a text description. v0 is optimized for UI generation so why not take the load off Claude and give it to v0?

Go to https://v0.app and add the following prompt:

```text
Create me a mockup of a dashboard page for a project called DevStash that is used to let developers create "Collections" of "Items" which can be snippets, prompts, notes, commands, files, images and links. Here are some guidelines:

## **General Feel**

- Minimal and modern
- Dev‑focused, dark by default
- Inspired by Notion, Linear, Raycast

## **Layout**

- Collapsible sidebar
- Main content grid/list
- Top bar with search on left and user icon on right
- Collection cards in main section with the background color and icon that pertain to the content type within it
- Stats above collection cards (Total collection & item count, favorite collection count, last updated )
- Sidebar with types with icon and most recent collections
- Settings link at bottom of sidebar

## **Responsive Notes**

- Sidebar becomes drawer on mobile
- Touch-friendly interactions

## **Micro-interactions**

- Soft shadows
- Smooth transitions
- Creeping loading bars
- Toast success/error messages

This should just be the Dashboard UI, not a working app.
```

What I did is take the UI/UX section from the `project-overview.md` file and added it to the prompt.

It will take 3-5 minutes to generate the mockup.

---

I like what I got back so I will take a screenshot and save it to `context/screenshots/dashboard-mockup.png`.

Now let's edit our `project-overview.md` file and reference the screenshot in the UI/UX section.

```markdown
## **Design Reference**

See `@context/screenshots/dashboard-mockup.png` for the main dashboard design. It does not have to be pixel perfect. Use it as a base.
```

Now that we have a prototyped screenshot and our docs completed, let's create our layout in the next lesson.
