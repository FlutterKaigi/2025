# Stripe Webhook Service

```txt
npm install
npm run dev
```

```txt
npm run deploy
```

[For generating/synchronizing types based on your Worker configuration run](https://developers.cloudflare.com/workers/wrangler/commands/#types):

```txt
npm run cf-typegen
```

Pass the `CloudflareBindings` as generics when instantiation `Hono`:

```ts
// src/index.ts
const app = new Hono<{ Bindings: CloudflareBindings }>()
```

## API Endpoints

### Create Payment Intent

Creates a Stripe Payment Intent for a ticket checkout session.

**Endpoint:** `PUT /api/v1/payment-intents/:userId/:ticketCheckoutId`

**Authentication:** Requires `x-api-key` header with BFF Engine API key

**Parameters:**
- `userId` (path): User ID
- `ticketCheckoutId` (path): Ticket checkout session ID

**Request Body:**
```json
{
  "price": 5000,
  "currency": "jpy",
  "metadata": {
    "custom_field": "value"
  }
}
```

**Response:**
```json
{
  "url": "https://checkout.stripe.com/pay/pi_xxx#xxx"
}
```

**Features:**
- Idempotent operation per user and ticket checkout ID
- Returns existing URL if Payment Intent already exists
- Validates ticket checkout session existence
- Updates checkout session with Payment Intent ID
