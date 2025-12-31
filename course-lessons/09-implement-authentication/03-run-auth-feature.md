# Run Auth Feature

We have our feature ready to build. Let's run the following:

```text
/feature start
```

It will create a bunch of todos with the stuff we added in the feature file. This is a big task, so be aware of what it's doing and what files it's creating if you can. We will test everything when it's done.

Keep an eye on the context if you are using the VSCode extension. If it creeps past 80%, you may want to stop at a pause point and `/compact`.

Once it is complete, test the following:

- go to /dashboard. You should be redirected
- try logging in with an email/password that does not exist
- register with email/password
- try logging in with the wrong password
- login with email/password
- logout

Github will not work yet because we need to add our keys. We will do that next and then review.
