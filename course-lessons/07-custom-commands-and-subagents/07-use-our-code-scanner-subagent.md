# Using Our Code Scanner Subagent

Let's now use our new subagent to find any issues and optimizations in our entire codebase.

Enter the following prompt:

```text
Use the code-scanner agent to check the entire codebase. Report your findings
```

## Results

Depending on your results, you may want to optimize/fix any issues. It will probably say a bunch of stuff is not implemented yet like authentication, which is to be expected.

I would have it do any quick wins:

```text
We have not implemented most of this yet. We will work on it soon. Add any quick wins that we can do right now to the @context/current-feature.md file
```

Now we can run:

```bash
/feature start
```

It will most likely do things like:

- Add loading state with skeletons
- Validation
- Add error boundary
- try/catch in server components
- Database indexes
- Break up large files

Have it apply some of the changes and then test. For instance, have it add the error boundary and then change the DATABASE_URL and make sure you can see it.

Slow down the connection in the devtools and test the skeleton loading, etc.

Once done:

```bash
/feature review
/feature complete
```

Do you see how helpful this is as opposed to vibe coding and just letting it do what it wants? We are reviewing everything it does, testing and optimizing.
