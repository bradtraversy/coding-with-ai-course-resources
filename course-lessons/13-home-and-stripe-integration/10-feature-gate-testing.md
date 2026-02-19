# Feature Gate Testing

Before we add the webhooks, let's test out feature gating. I am going to run my script to clear out all users but the demo user. It will also reset the demo user's files and images, because they should not be allowed to have those as it is a free user. They also should not have more than 3 collections, so I am going to run the following prompt:

```text
Change the demo user seed data to only have 3 collections since it is a free user and they are limited to 3. Then run the clear user script, which deletes all users but the demo user and seeds their content. They should also have under 50 items.
```

## File & Image Gating

Now log in with the demo user and click on "Images". If you try and upload an image, you should not be able to. However, I don't even want the free user to see the image or file page. There is no reason to.

So run the following:

```text
I don't want free users to be able to go to the /items/files or /items/images. Let's show an upgrade page if they visit those links
```

## Collection Limit Gating

Our user should not be able to create more than 3 collections. Try it and make sure. If they can, let the model know.

We still have pro AI features, but those have not been implemented yet. We will do those soon. Let's move on to webhooks for stripe.