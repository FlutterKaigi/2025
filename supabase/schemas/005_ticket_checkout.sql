-- 一時的なチェックアウトデータを格納するテーブル
CREATE TYPE public.ticket_checkout_status AS enum('pending', 'completed', 'expired');

CREATE TABLE public.ticket_checkout_sessions (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
  user_id uuid NOT NULL REFERENCES public.users (id) ON DELETE CASCADE,
  ticket_type_id text NOT NULL REFERENCES public.ticket_types (id) ON DELETE CASCADE,
  status public.ticket_checkout_status NOT NULL DEFAULT 'pending',
  stripe_checkout_session_id text NOT NULL UNIQUE,
  stripe_checkout_url TEXT NOT NULL,
  ticket_checkout_workflow_id TEXT,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() + interval '10 minutes'),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_checkout_sessions enable ROW level security;

CREATE TABLE public.ticket_checkout_options (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
  checkout_session_id uuid NOT NULL REFERENCES public.ticket_checkout_sessions (id) ON DELETE CASCADE,
  ticket_option_id text NOT NULL REFERENCES public.ticket_options (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  UNIQUE (checkout_session_id, ticket_option_id)
);

ALTER TABLE public.ticket_checkout_options enable ROW level security;

-- インデックス作成
CREATE INDEX idx_ticket_checkout_sessions_user_id ON public.ticket_checkout_sessions (user_id);

CREATE INDEX idx_ticket_checkout_sessions_status ON public.ticket_checkout_sessions (status);

CREATE INDEX idx_ticket_checkout_sessions_expires_at ON public.ticket_checkout_sessions (expires_at);

CREATE INDEX idx_ticket_checkout_options_checkout_session_id ON public.ticket_checkout_options (checkout_session_id);
