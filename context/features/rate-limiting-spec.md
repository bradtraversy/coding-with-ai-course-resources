# Rate Limiting for Auth

## Overview

Implement rate limiting on authentication endpoints to prevent brute force attacks, credential stuffing, and abuse of email-sending endpoints.

## Requirements

- Add rate limiting to auth-related API routes
- Use Upstash Redis with `@upstash/ratelimit` for serverless-compatible limiting
- Create reusable rate limiting utility
- Return appropriate error responses (429 Too Many Requests)
- Display user-friendly error messages on the frontend

## Endpoints to Protect

| Endpoint | Limit | Window | Key By |
|----------|-------|--------|--------|
| `/api/auth/callback/credentials` (login) | 5 attempts | 15 min | IP + email |
| `/api/auth/register` | 3 attempts | 1 hour | IP |
| `/api/auth/forgot-password` | 3 attempts | 1 hour | IP |
| `/api/auth/reset-password` | 5 attempts | 15 min | IP |
| `/api/auth/resend-verification` | 3 attempts | 15 min | IP + email |

## Implementation

- Create `src/lib/rate-limit.ts` utility with Upstash client
- Use sliding window algorithm for smooth limiting
- Extract IP from `x-forwarded-for` header (Vercel) or request
- Combine IP + identifier (email) where applicable for tighter limits
- Return `{ success, remaining, reset }` from rate limit checks

## Environment Variables

```
UPSTASH_REDIS_REST_URL=
UPSTASH_REDIS_REST_TOKEN=
```

## Error Handling

- API returns 429 status with JSON: `{ error: "Too many attempts. Please try again in X minutes." }`
- Frontend displays error via toast notification
- Include `Retry-After` header in 429 responses

## Notes

- Upstash free tier allows 10k requests/day (sufficient for auth limiting)
- Rate limiting should fail open (allow request) if Upstash is unavailable
- Login limiting is tricky with NextAuth credentials - may need custom sign-in handler
- Consider adding rate limiting middleware for cleaner implementation later
