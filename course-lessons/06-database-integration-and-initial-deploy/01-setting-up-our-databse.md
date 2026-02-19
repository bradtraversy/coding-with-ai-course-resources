# Setting Up Our Database (Dev & Production Branch)

Now we want to setup our database. I'll be using Neon, which is a cloud PostgreSQL database. I use it for most projects. It's incredibly easy to setup, pricing is more than reasonable and they have branching.

## Setting Up Neon

Go to https://neon.com and log in with your Github account.

Create a new project called "devstash".

## Branching

What I like to do is use a production and a development branch. Production is there by default. Add a development branch as well. Each have their own connection strings. We add the dev one in our local env file and we add the prod one in Vercel or wherever you deploy. 

By default, you should have a production and development branch. Before we get the connection string, let's setup Prisma with our model. We will do that next.
