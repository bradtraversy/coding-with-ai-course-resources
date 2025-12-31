# Stripe Integration Plan for DevStash Pro

## Current State Analysis

### User Model Schema

The User model in `prisma/schema.prisma` already has the necessary fields for Stripe integration:

```prisma
model User {
  id                   String   @id @default(cuid())
  email                String   @unique
  isPro                Boolean  @default(false)
  stripeCustomerId     String?
  stripeSubscriptionId String?
  // ... other fields
}
```

**Status:** Schema is ready for Stripe integration.

### Authentication Setup

- **NextAuth v5** with JWT strategy (`src/lib/auth.config.ts`)
- Session includes `user.id` via JWT callback
- `getCurrentUserId()` helper for server actions (`src/lib/auth.ts`)
- Protected routes: `/dashboard`, `/items`, `/collections`, `/profile`, `/settings`, `/favorites`

### Server Action Patterns

All server actions follow a consistent pattern:

- Use `getCurrentUserId()` for authentication
- Return `{ success: boolean, error?: string, data?: T }`
- Validation with Zod schemas
- Error handling with `logError()` utility

### API Route Patterns

- CSRF protection via `validateOrigin()` helper (`src/lib/api-utils.ts`)
- Authentication check: `const session = await auth()`
- Consistent error responses with proper HTTP status codes

### Existing Subscription/Payment Code

**None exists.** No Stripe or payment-related code is currently in the codebase.

---

## Feature Gating Requirements

### Free Tier Limits (from PricingSection.tsx)

| Resource            | Free | Pro       |
| ------------------- | ---- | --------- |
| Items               | 50   | Unlimited |
| Collections         | 3    | Unlimited |
| Full-text search    | Yes  | Yes       |
| Syntax highlighting | Yes  | Yes       |
| AI features         | No   | Yes       |
| File uploads        | No   | Yes       |
| Custom item types   | No   | Yes       |
| Export (JSON/ZIP)   | No   | Yes       |

### Where Limits Need to Be Enforced

1. **Item Creation** (`src/actions/items.ts:createItem`)

   - Check item count before creating new items
   - Block file/image uploads for free users

2. **Collection Creation** (`src/actions/collections.ts:createCollection`)

   - Check collection count before creating

3. **File Upload API** (`src/app/api/upload/route.ts`)

   - Block uploads for free users

4. **AI Features** (not yet implemented)

   - Will need Pro gating when added

5. **Export Features** (not yet implemented)
   - Will need Pro gating when added

---

## Implementation Plan

### Phase 1: Dependencies & Environment Setup

#### 1.1 Install Stripe SDK

```bash
npm install stripe
```

#### 1.2 Environment Variables

Add to `.env`:

```env
# Stripe
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLISHABLE_KEY=pk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
STRIPE_PRICE_ID_MONTHLY=price_...
STRIPE_PRICE_ID_YEARLY=price_...
```

### Phase 2: Stripe Configuration

#### 2.1 Create Stripe Client (`src/lib/stripe.ts`)

```typescript
import Stripe from 'stripe';

if (!process.env.STRIPE_SECRET_KEY) {
  throw new Error('Missing STRIPE_SECRET_KEY environment variable');
}

export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
  apiVersion: '2024-12-18.acacia',
  typescript: true,
});

export const STRIPE_CONFIG = {
  priceIdMonthly: process.env.STRIPE_PRICE_ID_MONTHLY!,
  priceIdYearly: process.env.STRIPE_PRICE_ID_YEARLY!,
};
```

### Phase 3: Subscription Actions

#### 3.1 Create Subscription Actions (`src/actions/subscription.ts`)

```typescript
'use server';

import { z } from 'zod';
import { stripe, STRIPE_CONFIG } from '@/lib/stripe';
import { prisma } from '@/lib/prisma';
import { getCurrentUserId } from '@/lib/auth';
import { logError } from '@/lib/logger';

export type SubscriptionStatus = {
  isPro: boolean;
  subscriptionId: string | null;
  currentPeriodEnd: Date | null;
  cancelAtPeriodEnd: boolean;
  plan: 'monthly' | 'yearly' | null;
};

const billingIntervalSchema = z.enum(['monthly', 'yearly']);

export async function getSubscriptionStatus(): Promise<SubscriptionStatus> {
  const userId = await getCurrentUserId();

  const user = await prisma.user.findUnique({
    where: { id: userId },
    select: {
      isPro: true,
      stripeSubscriptionId: true,
    },
  });

  if (!user?.stripeSubscriptionId) {
    return {
      isPro: user?.isPro ?? false,
      subscriptionId: null,
      currentPeriodEnd: null,
      cancelAtPeriodEnd: false,
      plan: null,
    };
  }

  const subscription = await stripe.subscriptions.retrieve(
    user.stripeSubscriptionId
  );

  return {
    isPro: user.isPro,
    subscriptionId: subscription.id,
    currentPeriodEnd: new Date(subscription.current_period_end * 1000),
    cancelAtPeriodEnd: subscription.cancel_at_period_end,
    plan:
      subscription.items.data[0]?.price.id === STRIPE_CONFIG.priceIdMonthly
        ? 'monthly'
        : 'yearly',
  };
}

export async function createCheckoutSession(
  interval: 'monthly' | 'yearly'
): Promise<{ url: string } | { error: string }> {
  const userId = await getCurrentUserId();

  const validated = billingIntervalSchema.safeParse(interval);
  if (!validated.success) {
    return { error: 'Invalid billing interval' };
  }

  const user = await prisma.user.findUnique({
    where: { id: userId },
    select: { email: true, stripeCustomerId: true },
  });

  if (!user) {
    return { error: 'User not found' };
  }

  try {
    // Create or retrieve customer
    let customerId = user.stripeCustomerId;

    if (!customerId) {
      const customer = await stripe.customers.create({
        email: user.email,
        metadata: { userId },
      });
      customerId = customer.id;

      await prisma.user.update({
        where: { id: userId },
        data: { stripeCustomerId: customerId },
      });
    }

    const priceId =
      interval === 'monthly'
        ? STRIPE_CONFIG.priceIdMonthly
        : STRIPE_CONFIG.priceIdYearly;

    const session = await stripe.checkout.sessions.create({
      customer: customerId,
      mode: 'subscription',
      line_items: [{ price: priceId, quantity: 1 }],
      success_url: `${process.env.AUTH_URL}/settings?success=true`,
      cancel_url: `${process.env.AUTH_URL}/settings?canceled=true`,
      metadata: { userId },
    });

    return { url: session.url! };
  } catch (error) {
    logError('Failed to create checkout session:', error);
    return { error: 'Failed to create checkout session' };
  }
}

export async function createBillingPortalSession(): Promise<
  { url: string } | { error: string }
> {
  const userId = await getCurrentUserId();

  const user = await prisma.user.findUnique({
    where: { id: userId },
    select: { stripeCustomerId: true },
  });

  if (!user?.stripeCustomerId) {
    return { error: 'No billing account found' };
  }

  try {
    const session = await stripe.billingPortal.sessions.create({
      customer: user.stripeCustomerId,
      return_url: `${process.env.AUTH_URL}/settings`,
    });

    return { url: session.url };
  } catch (error) {
    logError('Failed to create billing portal session:', error);
    return { error: 'Failed to access billing portal' };
  }
}
```

### Phase 4: Webhook Handler

#### 4.1 Create Webhook Route (`src/app/api/webhooks/stripe/route.ts`)

```typescript
import { NextRequest, NextResponse } from 'next/server';
import { headers } from 'next/headers';
import Stripe from 'stripe';
import { stripe } from '@/lib/stripe';
import { prisma } from '@/lib/prisma';
import { logError } from '@/lib/logger';

export async function POST(request: NextRequest) {
  const body = await request.text();
  const headersList = await headers();
  const signature = headersList.get('stripe-signature');

  if (!signature) {
    return NextResponse.json({ error: 'No signature' }, { status: 400 });
  }

  let event: Stripe.Event;

  try {
    event = stripe.webhooks.constructEvent(
      body,
      signature,
      process.env.STRIPE_WEBHOOK_SECRET!
    );
  } catch (error) {
    logError('Webhook signature verification failed:', error);
    return NextResponse.json({ error: 'Invalid signature' }, { status: 400 });
  }

  try {
    switch (event.type) {
      case 'checkout.session.completed': {
        const session = event.data.object as Stripe.Checkout.Session;
        const userId = session.metadata?.userId;
        const subscriptionId = session.subscription as string;

        if (userId && subscriptionId) {
          await prisma.user.update({
            where: { id: userId },
            data: {
              isPro: true,
              stripeSubscriptionId: subscriptionId,
              stripeCustomerId: session.customer as string,
            },
          });
        }
        break;
      }

      case 'customer.subscription.updated': {
        const subscription = event.data.object as Stripe.Subscription;
        const customerId = subscription.customer as string;

        const isActive = ['active', 'trialing'].includes(subscription.status);

        await prisma.user.updateMany({
          where: { stripeCustomerId: customerId },
          data: {
            isPro: isActive,
            stripeSubscriptionId: isActive ? subscription.id : null,
          },
        });
        break;
      }

      case 'customer.subscription.deleted': {
        const subscription = event.data.object as Stripe.Subscription;
        const customerId = subscription.customer as string;

        await prisma.user.updateMany({
          where: { stripeCustomerId: customerId },
          data: {
            isPro: false,
            stripeSubscriptionId: null,
          },
        });
        break;
      }

      case 'invoice.payment_failed': {
        const invoice = event.data.object as Stripe.Invoice;
        const customerId = invoice.customer as string;

        // Optionally send email notification about failed payment
        // For now, just log it
        logError('Payment failed for customer:', customerId);
        break;
      }
    }

    return NextResponse.json({ received: true });
  } catch (error) {
    logError('Webhook handler error:', error);
    return NextResponse.json(
      { error: 'Webhook handler failed' },
      { status: 500 }
    );
  }
}
```

### Phase 5: Usage Limits Helper

#### 5.1 Create Usage Limits Module (`src/lib/usage-limits.ts`)

```typescript
import { prisma } from '@/lib/prisma';

export const FREE_TIER_LIMITS = {
  maxItems: 50,
  maxCollections: 3,
} as const;

export type UsageLimits = {
  isPro: boolean;
  items: { current: number; max: number; remaining: number };
  collections: { current: number; max: number; remaining: number };
  canUploadFiles: boolean;
  canUseAI: boolean;
  canExport: boolean;
  canCreateCustomTypes: boolean;
};

export async function getUserLimits(userId: string): Promise<UsageLimits> {
  const [user, itemCount, collectionCount] = await Promise.all([
    prisma.user.findUnique({
      where: { id: userId },
      select: { isPro: true },
    }),
    prisma.item.count({ where: { userId } }),
    prisma.collection.count({ where: { userId } }),
  ]);

  const isPro = user?.isPro ?? false;

  const maxItems = isPro ? Infinity : FREE_TIER_LIMITS.maxItems;
  const maxCollections = isPro ? Infinity : FREE_TIER_LIMITS.maxCollections;

  return {
    isPro,
    items: {
      current: itemCount,
      max: maxItems,
      remaining: Math.max(0, maxItems - itemCount),
    },
    collections: {
      current: collectionCount,
      max: maxCollections,
      remaining: Math.max(0, maxCollections - collectionCount),
    },
    canUploadFiles: isPro,
    canUseAI: isPro,
    canExport: isPro,
    canCreateCustomTypes: isPro,
  };
}

export async function canCreateItem(userId: string): Promise<boolean> {
  const limits = await getUserLimits(userId);
  return limits.items.remaining > 0;
}

export async function canCreateCollection(userId: string): Promise<boolean> {
  const limits = await getUserLimits(userId);
  return limits.collections.remaining > 0;
}

export async function canUploadFiles(userId: string): Promise<boolean> {
  const limits = await getUserLimits(userId);
  return limits.canUploadFiles;
}
```

### Phase 6: Modify Existing Actions for Gating

#### 6.1 Update `createItem` in `src/actions/items.ts`

Add at the beginning of the function:

```typescript
import { canCreateItem, canUploadFiles } from '@/lib/usage-limits';

// In createItem function, after getting userId:
const canCreate = await canCreateItem(userId);
if (!canCreate) {
  return {
    success: false,
    error:
      "You've reached the free tier limit of 50 items. Upgrade to Pro for unlimited items.",
  };
}

// For file/image types, check file upload permission:
if (typeName === 'file' || typeName === 'image') {
  const canUpload = await canUploadFiles(userId);
  if (!canUpload) {
    return {
      success: false,
      error:
        'File uploads require a Pro subscription. Upgrade to unlock this feature.',
    };
  }
}
```

#### 6.2 Update `createCollection` in `src/actions/collections.ts`

Add at the beginning of the function:

```typescript
import { canCreateCollection } from '@/lib/usage-limits';

// In createCollection function, after getting userId:
const canCreate = await canCreateCollection(userId);
if (!canCreate) {
  return {
    success: false,
    error:
      "You've reached the free tier limit of 3 collections. Upgrade to Pro for unlimited collections.",
  };
}
```

#### 6.3 Update Upload API (`src/app/api/upload/route.ts`)

Add after authentication check:

```typescript
import { canUploadFiles } from '@/lib/usage-limits';

// After session check:
const canUpload = await canUploadFiles(session.user.id);
if (!canUpload) {
  return NextResponse.json(
    { error: 'File uploads require a Pro subscription' },
    { status: 403 }
  );
}
```

### Phase 7: Subscription UI Components

#### 7.1 Create Subscription Section (`src/components/settings/SubscriptionSection.tsx`)

```typescript
'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Check, Crown, Loader2 } from 'lucide-react';
import { toast } from 'sonner';
import {
  createCheckoutSession,
  createBillingPortalSession,
  type SubscriptionStatus,
} from '@/actions/subscription';

interface SubscriptionSectionProps {
  status: SubscriptionStatus;
}

export function SubscriptionSection({ status }: SubscriptionSectionProps) {
  const [isLoading, setIsLoading] = useState(false);

  async function handleUpgrade(interval: 'monthly' | 'yearly') {
    setIsLoading(true);
    try {
      const result = await createCheckoutSession(interval);
      if ('error' in result) {
        toast.error(result.error);
      } else {
        window.location.href = result.url;
      }
    } catch {
      toast.error('Something went wrong');
    } finally {
      setIsLoading(false);
    }
  }

  async function handleManageBilling() {
    setIsLoading(true);
    try {
      const result = await createBillingPortalSession();
      if ('error' in result) {
        toast.error(result.error);
      } else {
        window.location.href = result.url;
      }
    } catch {
      toast.error('Something went wrong');
    } finally {
      setIsLoading(false);
    }
  }

  if (status.isPro) {
    return (
      <Card>
        <CardHeader>
          <div className='flex items-center gap-2'>
            <CardTitle>Subscription</CardTitle>
            <Badge className='bg-amber-500 text-black'>
              <Crown className='mr-1 h-3 w-3' />
              Pro
            </Badge>
          </div>
          <CardDescription>
            Manage your Pro subscription and billing
          </CardDescription>
        </CardHeader>
        <CardContent className='space-y-4'>
          <div className='text-sm text-muted-foreground'>
            <p>Plan: {status.plan === 'yearly' ? 'Yearly' : 'Monthly'}</p>
            {status.currentPeriodEnd && (
              <p>
                {status.cancelAtPeriodEnd ? 'Expires' : 'Renews'} on{' '}
                {status.currentPeriodEnd.toLocaleDateString()}
              </p>
            )}
          </div>
          <Button onClick={handleManageBilling} disabled={isLoading}>
            {isLoading && <Loader2 className='mr-2 h-4 w-4 animate-spin' />}
            Manage Billing
          </Button>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Upgrade to Pro</CardTitle>
        <CardDescription>
          Unlock unlimited items, collections, file uploads, and AI features
        </CardDescription>
      </CardHeader>
      <CardContent className='space-y-6'>
        <ul className='space-y-2 text-sm'>
          {[
            'Unlimited items & collections',
            'File & image uploads',
            'AI auto-tagging & summaries',
            'Custom item types',
            'Export to JSON/ZIP',
          ].map((feature) => (
            <li key={feature} className='flex items-center gap-2'>
              <Check className='h-4 w-4 text-emerald-500' />
              {feature}
            </li>
          ))}
        </ul>

        <div className='flex flex-col gap-3 sm:flex-row'>
          <Button
            onClick={() => handleUpgrade('monthly')}
            disabled={isLoading}
            className='flex-1'
          >
            {isLoading && <Loader2 className='mr-2 h-4 w-4 animate-spin' />}
            $8/month
          </Button>
          <Button
            onClick={() => handleUpgrade('yearly')}
            disabled={isLoading}
            variant='outline'
            className='flex-1'
          >
            {isLoading && <Loader2 className='mr-2 h-4 w-4 animate-spin' />}
            $72/year (save $24)
          </Button>
        </div>
      </CardContent>
    </Card>
  );
}
```

#### 7.2 Update Settings Page (`src/app/settings/page.tsx`)

Add subscription section:

```typescript
import { getSubscriptionStatus } from '@/actions/subscription';
import { SubscriptionSection } from '@/components/settings/SubscriptionSection';

// In the component:
const [profile, editorPreferences, subscriptionStatus] = await Promise.all([
  getProfileData(),
  getEditorPreferences(),
  getSubscriptionStatus(),
]);

// Add to JSX before Editor Preferences:
<SubscriptionSection status={subscriptionStatus} />;
```

#### 7.3 Create Usage Limits Display (`src/components/settings/UsageLimitsSection.tsx`)

```typescript
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import type { UsageLimits } from '@/lib/usage-limits';

interface UsageLimitsSectionProps {
  limits: UsageLimits;
}

export function UsageLimitsSection({ limits }: UsageLimitsSectionProps) {
  if (limits.isPro) {
    return null; // Pro users don't need to see limits
  }

  const itemPercentage = (limits.items.current / limits.items.max) * 100;
  const collectionPercentage =
    (limits.collections.current / limits.collections.max) * 100;

  return (
    <Card>
      <CardHeader>
        <CardTitle>Usage</CardTitle>
      </CardHeader>
      <CardContent className='space-y-4'>
        <div>
          <div className='mb-1 flex justify-between text-sm'>
            <span>Items</span>
            <span>
              {limits.items.current} / {limits.items.max}
            </span>
          </div>
          <Progress value={itemPercentage} />
        </div>
        <div>
          <div className='mb-1 flex justify-between text-sm'>
            <span>Collections</span>
            <span>
              {limits.collections.current} / {limits.collections.max}
            </span>
          </div>
          <Progress value={collectionPercentage} />
        </div>
      </CardContent>
    </Card>
  );
}
```

### Phase 8: Add `isPro` to Session

#### 8.1 Extend Session Type (`src/types/next-auth.d.ts`)

```typescript
import 'next-auth';

declare module 'next-auth' {
  interface Session {
    user: {
      id: string;
      email?: string | null;
      name?: string | null;
      image?: string | null;
      isPro: boolean;
    };
  }
}

declare module 'next-auth/jwt' {
  interface JWT {
    isPro?: boolean;
  }
}
```

#### 8.2 Update Auth Callbacks (`src/lib/auth.ts`)

```typescript
// In the callbacks section:
callbacks: {
  async session({ session, token }) {
    if (token.sub && session.user) {
      session.user.id = token.sub;
      session.user.isPro = token.isPro ?? false;
    }
    return session;
  },
 async jwt({ token, user }) {
  if (user) {
    token.sub = user.id;
  }

  // Always sync isPro from database to catch webhook updates
  if (token.sub) {
    const dbUser = await prisma.user.findUnique({
      where: { id: token.sub },
      select: { isPro: true },
    });
    token.isPro = dbUser?.isPro ?? false;
  }

  return token;
},
},
```

---

## Stripe Dashboard Setup

### 1. Create Products and Prices

1. Go to Stripe Dashboard > Products
2. Create a product: "DevStash Pro"
3. Add two prices:
   - Monthly: $8/month (recurring)
   - Yearly: $72/year (recurring) - 25% discount

### 2. Configure Customer Portal

1. Go to Settings > Billing > Customer portal
2. Enable:
   - Invoice history
   - Subscription cancellation
   - Subscription switching (between monthly/yearly)
   - Update payment methods

### 3. Set Up Webhook

1. Go to Developers > Webhooks
2. Add endpoint: `https://your-domain.com/api/webhooks/stripe`
3. Select events:
   - `checkout.session.completed`
   - `customer.subscription.created`
   - `customer.subscription.updated`
   - `customer.subscription.deleted`
   - `invoice.payment_failed`
   - `invoice.payment_succeeded`

### 4. Test Mode

- Use test mode during development
- Test card: `4242 4242 4242 4242`
- Any future expiry date, any CVC

---

## Testing Checklist

### Unit Tests

- [ ] `canCreateItem` returns false when at limit
- [ ] `canCreateCollection` returns false when at limit
- [ ] `canUploadFiles` returns false for free users
- [ ] `getUserLimits` returns correct values for free/pro users

### Integration Tests

- [ ] Checkout session creation works
- [ ] Billing portal session creation works
- [ ] Webhook signature verification
- [ ] Subscription status updates correctly

### Manual Testing

- [ ] Free user can create up to 50 items
- [ ] Free user cannot create 51st item (gets error)
- [ ] Free user can create up to 3 collections
- [ ] Free user cannot create 4th collection (gets error)
- [ ] Free user cannot upload files
- [ ] Upgrade flow redirects to Stripe Checkout
- [ ] Successful payment updates user to Pro
- [ ] Pro user has no limits
- [ ] Pro user can upload files
- [ ] Cancellation removes Pro status at period end
- [ ] Billing portal allows subscription management

### Webhook Testing

Use Stripe CLI for local testing:

```bash
stripe listen --forward-to localhost:3000/api/webhooks/stripe
```

---

## Implementation Order

1. **Environment Setup**

   - Install `stripe` package
   - Add environment variables

2. **Core Stripe Integration**

   - Create `src/lib/stripe.ts`
   - Create `src/lib/usage-limits.ts`
   - Create `src/actions/subscription.ts`

3. **Webhook Handler**

   - Create `src/app/api/webhooks/stripe/route.ts`

4. **Session Enhancement**

   - Add `isPro` to session types
   - Update auth callbacks

5. **Feature Gating**

   - Update `createItem` action
   - Update `createCollection` action
   - Update upload API route

6. **UI Components**

   - Create `SubscriptionSection`
   - Create `UsageLimitsSection`
   - Update Settings page

7. **Testing & Refinement**
   - Write tests
   - Manual testing
   - Stripe webhook testing

---

## Files Summary

### New Files to Create

| File                                              | Purpose                     |
| ------------------------------------------------- | --------------------------- |
| `src/lib/stripe.ts`                               | Stripe client configuration |
| `src/lib/usage-limits.ts`                         | Free tier limits logic      |
| `src/actions/subscription.ts`                     | Subscription server actions |
| `src/app/api/webhooks/stripe/route.ts`            | Stripe webhook handler      |
| `src/types/next-auth.d.ts`                        | Session type extensions     |
| `src/components/settings/SubscriptionSection.tsx` | Subscription UI             |
| `src/components/settings/UsageLimitsSection.tsx`  | Usage display UI            |

### Files to Modify

| File                          | Changes                              |
| ----------------------------- | ------------------------------------ |
| `src/actions/items.ts`        | Add limit checks in createItem       |
| `src/actions/collections.ts`  | Add limit checks in createCollection |
| `src/app/api/upload/route.ts` | Add Pro check for uploads            |
| `src/lib/auth.ts`             | Add isPro to JWT/session callbacks   |
| `src/app/settings/page.tsx`   | Add subscription section             |
| `package.json`                | Add stripe dependency                |
