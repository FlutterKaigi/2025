CREATE TABLE public.ticket_types (
  id text PRIMARY KEY NOT NULL, -- 'early_bird', 'normal', 'personal_sponsor' など
  name text UNIQUE NOT NULL, -- 'アーリーバード', 'ノーマル', '個人スポンサー' など
  price integer NOT NULL,
  max_quantity integer,
  description text,
  is_active boolean DEFAULT TRUE,
  sale_starts_at TIMESTAMP WITH TIME ZONE,
  sale_ends_at TIMESTAMP WITH TIME ZONE,
  stripe_price_id TEXT NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_types enable ROW level security;

CREATE TABLE public.ticket_options (
  id text PRIMARY KEY NOT NULL,
  ticket_type_id text NOT NULL REFERENCES public.ticket_types (id) ON DELETE CASCADE,
  name text NOT NULL,
  description text,
  max_quantity integer,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_options enable ROW level security;

-- ========================================
-- 3. チケット購入テーブル
-- ========================================
CREATE TYPE public.ticket_purchase_status AS enum('completed', 'refunded');

CREATE TABLE public.ticket_purchases (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
  user_id uuid NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  ticket_type_id text NOT NULL REFERENCES public.ticket_types (id) ON DELETE CASCADE,
  status public.ticket_purchase_status NOT NULL DEFAULT 'completed',
  stripe_payment_intent_id text UNIQUE, -- Stripe決済ID
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  nameplate_id VARCHAR(4), -- ネームプレートID(ticket_type_idがnormal以外の時のみ出現), A-01, B-01,..., D-01, A-02, B-02,..., D-02,...
  UNIQUE (user_id, ticket_type_id)
);

ALTER TABLE public.ticket_purchases enable ROW level security;

-- ========================================
-- 4. チケット購入オプションテーブル
-- ========================================
CREATE TABLE public.ticket_purchase_options (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7(),
  ticket_purchase_id uuid NOT NULL REFERENCES public.ticket_purchases (id) ON DELETE CASCADE,
  ticket_option_id text NOT NULL REFERENCES public.ticket_options (id) ON DELETE CASCADE,
  option_value text,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  UNIQUE (ticket_purchase_id, ticket_option_id)
);

ALTER TABLE public.ticket_purchase_options enable ROW level security;

CREATE TABLE public.stripe_webhook_logs (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  stripe_event_id text UNIQUE NOT NULL,
  event_type text NOT NULL,
  payment_intent_id text,
  processed boolean DEFAULT FALSE,
  error_message text,
  raw_data jsonb NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.stripe_webhook_logs enable ROW level security;

CREATE INDEX idx_ticket_purchases_user_id ON public.ticket_purchases (user_id);

CREATE INDEX idx_ticket_purchases_ticket_type_id ON public.ticket_purchases (ticket_type_id);

CREATE INDEX idx_ticket_purchases_status ON public.ticket_purchases (status);

CREATE INDEX idx_ticket_purchases_stripe_payment_intent_id ON public.ticket_purchases (stripe_payment_intent_id);

CREATE INDEX idx_ticket_purchase_options_ticket_purchase_id ON public.ticket_purchase_options (ticket_purchase_id);

CREATE INDEX idx_stripe_webhook_logs_stripe_event_id ON public.stripe_webhook_logs (stripe_event_id);

CREATE INDEX idx_stripe_webhook_logs_processed ON public.stripe_webhook_logs (processed);
