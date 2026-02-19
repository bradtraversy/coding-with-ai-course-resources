# Auth Credentials - Email/Password Provider

## Overview
Add Credentials provider for email/password authentication with registration.

## Requirements
- Use bcryptjs for hashing (already installed)
- Add password field to User model via migration if not already there
- Update `auth.config.ts` with Credentials provider placeholder
- Update `auth.ts` to override Credentials with bcrypt validation
- Create registration API route at `/api/auth/register`

## Registration API Route
`POST /api/auth/register`
- Accept: name, email, password, confirmPassword
- Validate passwords match
- Check if user already exists
- Hash password with bcryptjs
- Create user in database
- Return success/error response

## Notes
### Credentials Provider in Split Pattern
- `auth.config.ts`: Add Credentials provider with `authorize: () => null` placeholder
- `auth.ts`: Override the Credentials provider with actual bcrypt validation logic

## Testing
1. Test registration via curl:
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@test.com","password":"password123","confirmPassword":"password123"}'
```
2. Go to `/api/auth/signin`
3. Sign in with email/password
4. Verify redirect to `/dashboard`
5. Verify GitHub OAuth still works

## References
- Credentials provider: https://authjs.dev/getting-started/authentication/credentials