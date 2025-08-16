-- 企業の掲載情報変更申請
CREATE TABLE public.company_drafts (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE NULL,
  slug text NOT NULL UNIQUE CHECK (slug <> ''),
  pr_text text NOT NULL CHECK (pr_text <> ''),
  website_url text NOT NULL CHECK (website_url <> ''),
  x_account text CHECK (x_account <> ''),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.company_drafts enable ROW level security;

-- 企業の掲載情報変更申請の承認
CREATE TABLE public.company_draft_approvals (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_draft_id smallint REFERENCES public.company_drafts (id) ON DELETE CASCADE,
  approved_by uuid REFERENCES public.users (id) ON DELETE SET NULL NULL,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.company_draft_approvals enable ROW level security;
