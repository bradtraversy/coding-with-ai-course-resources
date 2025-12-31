# Files & Images

Now we need to handle the file and image types. In the last lesson, we setup our Cloudflare R2 bucket and added the env values. Now we need to setup uploading.

This will include using the S3 SDK which is compatible with Cloudflare R2. That needs to be initialized.

We need to create an API route for file upload and delete. We need a drag and drop component in the ItemModal component for files and images.

## Feature Spec

Create a file at `context/features/file-image-spec.md` and add the content from the course file.

Let's run the following:

```text
/feature load file-image-spec.md
```

Then start it: `/feature start`

Unit tests are kind of hard here without mocking because we're dealing with R2 endpoints and files. So we'll probably skip testing here.

Test manually by uploading a file and an image and make sure it works and gets uploaded to your R2 bucket.

Once finished, run:

```text
/feature review
/feature complete
/clear
```
