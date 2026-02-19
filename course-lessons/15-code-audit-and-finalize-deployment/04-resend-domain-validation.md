# Resend Domain Validation

We are just about ready. The one thing we have left is to add the domain to Resend so that we can actually register with more users.

Go to https://resend.com and click on "Domains" and add a new domain.

From here, you need to copy the records to your domain registrar dashboard. There are a few TXT records and an MX record. Be sure to add the host and the value in your domain dashboard, then click save in Resend. It will take a couple minutes to propogate.

## Change The Onboarding Email

Now you just need to change the email in your code from `onboarding@resend.dev` to `noreply@yourdomain.com`.

Also, make sure that in your env variables you have `NEXT_PUBLIC_APP_URL` set to the domain. It uses this for the redirect from the email button.

That's it, now you should be able to register with any email and use the verification system.