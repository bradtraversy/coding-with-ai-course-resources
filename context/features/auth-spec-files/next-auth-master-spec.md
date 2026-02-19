# User Authentication

## Overview

Implement Next Auth v5 with email/password and Github authentication.

## Requirements

- Install Next Auth latest version
- Add NextAuth required models to Prisma schema (Account, Session, VerificationToken)
- Set up NextAuth v5 with Prisma adapter (see notes)
- Add GitHub OAuth provider
- Add Credentials provider for email/password login
- Create register page with name, email, password and confirm password fields
- Create sign-in page with email/password form and "Sign in with GitHub" button
- Hash passwords with bcryptjs on registration
- Add middleware to protect dashboard routes (see notes)
- Redirect unauthenticated users to sign-in page
- Add user avatar and name in the top bar
- Add sign out link to a dropdown on user avatar click
- Avatar should come from either Github or use initials

## Notes

There have been changes to Prisma 7 and the prisma adapter as well as the naming of the middleware file. Be sure to check the latest documentation.

- Always use migrations, never `db push`:
- npx prisma migrate dev --name add-auth-models
- Next.js 16 + Prisma 7 Edge Compatibility
- Use the split auth config pattern (see below)

### Next.js 15 + Prisma 7 Edge Compatibility

Use the split auth config pattern:

- `src/lib/auth.config.ts` - Base config with providers, JWT session, callbacks (including authorized for route protection). NO Prisma imports. Credentials provider has authorize: () => null placeholder.
- `src/lib/auth.ts` - Extends auth.config, adds PrismaAdapter, overrides Credentials with actual bcrypt validation.
- `src/proxy.ts` - Edge-compatible middleware. Only imports from auth.config.ts: export default NextAuth(authConfig).auth

## References

- Edge compatibility: https://authjs.dev/getting-started/installation#edge-compatibility
- Prisma adapter: https://authjs.dev/getting-started/adapters/prisma
