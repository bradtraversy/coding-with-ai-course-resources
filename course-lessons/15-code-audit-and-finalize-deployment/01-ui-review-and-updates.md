# UI Review & Updates

We are just about done with our MVP. I would like to review and possibly change a couple UI aspects. You may have a much different UI than I do. So use your own discretion to make any changes you see fit.

## Font Size

One concern that I have is the font size. I think most of it is fine. The cards and dashboard. Where I'm most concerned is the item drawer. The selling point of this project is being able to save items and quickly access them. You can't do that if you can't see it.

The code editor is good and the user can control that. However the rest of it is pretty small. What I want to do is ask the agent what it thinks.

Let's run the following prompt:

```text
I have some concerns about the font size in certain areas, specifically the item drawer. The code editor is good as that is controlled by the user. The header items and the rest of the drawer seem really small. The markdown editor also seems a bit small. Use Playwright to inspect the UI and review the font sizes and make suggestions
```

## UI Review

Let's do an overall review of the UI:

```text
Use the ui reviewer and Playwright and give me any overall suggestions that you may have for the UI layout. A couple things that I want to mention is there is no sidebar highlighting of links and there is no github button on the register page. Add those in your report. Keep the report concise with straightforward results. Use Playwright not just code review
```

Use your discretion on what to change.

## Item Drawer Slide Resize

I want to make the item drawer resizable. Let's add the following prompt:

```text
/feature load I would like the option to resize the item drawer horizontally to make the editor wider to be able to see more code at one time.
```