-- 企業とユーザーの紐づけを管理するテーブル
CREATE TABLE public.company_members (
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  user_id uuid REFERENCES public.users (id) ON DELETE CASCADE,
  joined_at timestamp DEFAULT now() NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  PRIMARY KEY (company_id, user_id)
);

ALTER TABLE public.company_members enable ROW level security;
