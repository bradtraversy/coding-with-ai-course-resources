# Cloudflare R2 Setup

For files and images, we will be using Cloudflare R2. If you want to use an alternative like Amazon S3, that's file as well.

We need to get our API keys and some other values. Put this in your `.env` for now and we will add each value:

```
# Cloudflare R2 Storage
R2_ACCOUNT_ID=""
R2_ACCESS_KEY_ID=""
R2_SECRET_ACCESS_KEY=""
R2_BUCKET_NAME=""
R2_PUBLIC_URL=""
```

### Sign Up

Go to https://dash.cloudflare.com/sign-up/r2 and sign up with Google or Github and login.

Click on **Create Bucket**, name it something like "devstash-uploads" and select "Automatic".

Add your bucket name to your `.env`:

```
R2_BUCKET_NAME="devstash-uploads"
```

### Public URL

Click on the **Settings** tab and click **Public Development URL** and "Enable" and type in "allow" to confirm.

Put that in your `.env`:

```
R2_PUBLIC_URL="https://pub-e713af59787df8ba908ed32a2b3935e5.r2.dev"
```

### Account ID

On the main R2 Object Storage page, you will see your account ID. It is also the string right after **dash.cloudflare.com/**. Add it to the `.env`:

```
R2_ACCOUNT_ID="10fcf0ef1vcd2ea7b7f0c5e4ef8226d8"
```

### Access Keys

On the main R2 Object Storage page, you will see "API Tokens" near your ID. Click the "Manage" Button.

Click on "Create Account API token".

Name it and then select **Object Read & Write**.

Apply to this specific bucket.

Click "Create Account API Token"

Now add the access token id and secret to your `.env` file:

```
R2_ACCESS_KEY_ID="4f65b06fg05fsc49de8ffe1ea275b434"
R2_SECRET_ACCESS_KEY="et3c20387c6f0b17fcdd8cf040fb0f595ddb4efad2973da0700609323d718b93"
```

Now you should be all setup with R2.

You can also add this to `.env.production` for reference to what will be added in production.
