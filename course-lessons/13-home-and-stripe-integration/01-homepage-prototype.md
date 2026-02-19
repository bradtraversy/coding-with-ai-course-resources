# Homepage Prototype

Now we're ready to start on the homepage or marketing page. We have an MVP of the product itself, now we need the information for people to read when they land on the website.

There are a lot of ways we can do this. You may want to create a custom design from scratch either by you or a designer. Maybe create a figma mockup and then feed it to the AI or code it yourself. You may even have AI create the whole thing with you giving minimal input.

I know the layout that I want already, which is pretty simple. I'll probably change this and add to it later, but remember, this is just an MVP.

## HTML/CSS Version

What I like to do is have the AI create an HTML/CSS version first and iterate on that and then when I like it, I'll have it implemented into our actual project.

## Feature Spec For HTML/CSS Mockup

Let's create a document at `context/homepage-mockup-spec.md`. You can get the file content from the course project file.

It specifies the things we want like the colors, which will match the dashboard and content type colors.

We will have a hero section with some animated icons of places you would normally keep this stuff like notion, github, files, etc and it will point to a mockup of our dashboard.

Other than that, just some features and content types, a pricing grid and a CTA.

Lets load this file as a feature:

```text
/feature load homepage-mockup-spec.md

/feature start
```

It will go through all of the requirements and implement the new homepage.

I made a few adjustments. I will attach the template to this lesson and it will be in the course files. If you want to use the one I have, you can or you can use the one you generated.

## Logo & Favicon

I will probably have a logo designed later on for the actual product, but for now, we can generate one.

Let's run the following prompt:

```text
Create a logo for the navbar. Use some kind of blue box/parcel. Make it an SVG in its own file.
```

You can iterate on it if you don't like it or you can use the one from the course files.

For the favicon, I will take the SVG and go to https://webutils.io/tool/favicon-generator and drag it in to create an ICO file.

Then we can run the following prompt:

```text
I have added a favicon.ico in the prototypes folder. Use that as the favicon.
```

Once you are done with the prototype, run the following:

```text
/feature review
/feature complete
/clear
```

Feel free to run a `/cleanup` or even use the code-scanner subagent at this point.
