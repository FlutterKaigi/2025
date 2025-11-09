-- 個人の掲載情報変更申請
CREATE TABLE public.individual_drafts (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  individual_id integer REFERENCES public.individuals (id) ON DELETE CASCADE,
  logo_name text,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.individual_drafts enable ROW level security;

-- 個人の掲載情報変更申請の承認
CREATE TABLE public.individual_draft_approvals (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  individual_draft_id integer REFERENCES public.individual_drafts (id) ON DELETE CASCADE,
  approved_by uuid REFERENCES public.users (id) ON DELETE SET NULL NULL,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.individual_draft_approvals enable ROW level security;
