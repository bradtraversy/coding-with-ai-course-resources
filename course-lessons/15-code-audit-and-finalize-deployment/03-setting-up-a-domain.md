# Setting Up A Domain

So our project is ready for launch. At the moment, we are using a Vercel domain name, which is ok for personal projects, testing and development, but not what you want in a real project. I have registered the domain "devstash.io", so I'm going to show you how I would set it up.

I registered it at Namecheap, so I have that dashboard open and click "Manage" for the domain. Make sure that "Namecheap Basic DNS" is selected and then click on the  "Advanced DNS" tab. From here, we need to add a couple records from Vercel. So let's get those setup.

## Vercel Domain Setup

In Vercel's dashboard, I will go to the project and then click on "Domains". From there, click "Add Existing". Enter the domain name and select the defaults.

By default, the www version redirects to the non-www version. You can keep that if you want, but I like the opposite. So I will click "Edit" for the non www version and select "Production". Then for the www-version, I will select "308 Permanent Redirect". That way, it always uses the non-www version.

## Add Values to Namecheap

Now click on "Learn More" next to the non-www version and copy the A record. Go to your Namecheap or other Domain Registrar and add that as an A record with @ for the host.

Then click "Read More" for the www-version and copy the CNAME value and add it as a CNAME to your registrar with www as the host. Save it and then wait for it to propagate.

It usually takes about 10 minutes, but it is possible that it can take 24 hours or so. So give it a chance. 

It should also install an SSL, so you will use https.


## Replacing The URL Where Needed

We have a bunch of places where we added the Vercel URL that need to be changed to the new domain. First off, let's go into the environment variables in Vercel and change what we need to there.

You want to edit the following variables to the new domain in the Vercel dashboard as well as the `.env.production` file:

- NEXT_PUBLIC_APP_URL="YOUR_DOMAIN"
- AUTH_URL="YOUR_DOMAIN"

We also need to change the domain in the Github OAuth app. Go to https://github.com/settings/developers and click on OAuth Apps. Click on the production one and change the domain and the callback URL to match your new domain.

Next, we will work on adding the domain to Resend so that we can finally register new users outside of the Resend email account.