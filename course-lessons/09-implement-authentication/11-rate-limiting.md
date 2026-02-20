# Rate Limiting

Now we need to implement our rate limiting using Upstash. You should have your Upstash env variables in dev and production.

## Spec File

There is a spec file in your course files at `context/features/rate-limiting-spec.md`. Copy that to your project's `context/features` folder.

Now run:

```
/feature load rate-limiting-spec.md
/feature start
```

It should create a utility for rate limiting and then add a check to each of the auth routes with specific number of attempts and a specific length. If you want to change any of these you can.

Once done, test by trying to login 4 times. On the 4th attempt you should get an error and 429 response.

If everything works as expected, run:

```
/feature review
/feature complete
```