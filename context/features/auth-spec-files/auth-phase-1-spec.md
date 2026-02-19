# Auth Setup - NextAuth + GitHub Provider

## Overview

Set up NextAuth v5 with Prisma adapter and GitHub OAuth. Use NextAuth's default pages for testing.

## Requirements

- Install NextAuth v5 (`next-auth@beta`) and `@auth/prisma-adapter`
- Set up split auth config pattern for edge compatibility
- Add GitHub OAuth provider
- Protect `/dashboard/*` routes using Next.js 16 proxy
- Redirect unauthenticated users to sign-in

## Files to Create

1. `src/auth.config.ts` - Edge-compatible config (providers only, no adapter)
2. `src/auth.ts` - Full config with Prisma adapter and JWT strategy
3. `src/app/api/auth/[...nextauth]/route.ts` - Export handlers from auth.ts
4. `src/proxy.ts` - Route protection with redirect logic
5. `src/types/next-auth.d.ts` - Extend Session type with user.id

## Key Gotchas

Use Context7 to verify the newest config and conventions.

- Use `next-auth@beta` (not `@latest` which installs v4)
- Proxy file must be at `src/proxy.ts` (same level as `app/`)
- Use named export: `export const proxy = auth(...)` not default export
- Use `session: { strategy: 'jwt' }` with split config pattern
- Don't set custom `pages.signIn` - use NextAuth's default page

## Environment Variables

```
AUTH_SECRET=
AUTH_GITHUB_ID=
AUTH_GITHUB_SECRET=
```

## Testing

1. Go to `/dashboard` - should redirect to sign-in
2. Click "Sign in with GitHub"
3. Verify redirect back to `/dashboard` after auth

## References

- Edge compatibility: https://authjs.dev/getting-started/installation#edge-compatibility
- Prisma adapter: https://authjs.dev/getting-started/adapters/prisma
