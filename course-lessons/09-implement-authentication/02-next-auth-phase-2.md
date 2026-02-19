# Next Auth Phase 2

Now we will implement phase 2 which will be the email/password login and register using the credentials provider.

Run the following command:

```text
/feature load auth-phase-2-spec.md
```

This will add everything to the "current-feature.md" file.

Now run `/feature start`.

It will show the todos and handle them one by one.

Once that is done, you should be able to test at `/api/auth/signin` with email and password.

If everything works ok, run the following:

```text
/feature review
/feature complete
```