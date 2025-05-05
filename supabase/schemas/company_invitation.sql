-- 企業(`companies`)への招待コード
CREATE TABLE public.company_invitation (
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  key text UNIQUE NOT NULL CHECK (key <> ''),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.company_invitation enable ROW level security;
