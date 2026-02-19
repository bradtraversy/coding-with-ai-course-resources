# Coding Standards & Interaction Rules

I know you guys are anxious to actually build something and I get that, but as I mentioned earlier, this is what AI coding is going to be like. Where it takes the place of the low-level syntax, we now work at a higher level to make sure it does it's job and that means making sure that it knows what it's building and how to build it and test it. So there's much more documentation than when we manually write code.

I have attached the files I will add in this lesson to the downloads. They're also in the main repo. So you can just take the files from the downloads and put them into your structure.

Just know that when you create your own project, you will be creating this stuff. You’ll probably have re-usable context files for things like coding-standards.md and ai-interactions.md. Feel free to use mine, but you may want it to be a bit different.

## AI Interactions

We created our CLAUDE.md in the last lesson that references `ai-interaction.md` file in your `context` folder. This is where we can specify general interaction rules like "be concise" and "explain decisions".

Copy the file from the course docs `/context/ai-interaction.md` file to your project `/context` file. Open it and take a look.

## Coding Standards

This is a file that specifies how I want my code to be written and formatted. A lot of it pertains to the technologies we're using. For instance TS errors should never be suppressed, we never use the `any` type, Next.js should use SSR by default, etc.

Copy the file from the course docs `context/coding-standards.md` file to your project `/context` file. Open it and take a look.

Over time, you will create your own standards or if you already know what you like and don't like to do, you can update this, although for this course, I would suggest leaving it alone so we're all on the same page.
