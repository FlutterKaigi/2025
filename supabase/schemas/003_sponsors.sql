-- 個人スポンサー
CREATE TABLE public.sponsor_individuals (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  individual_id smallint REFERENCES public.individuals (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_individuals enable ROW level security;

-- 企業スポンサー
CREATE TABLE public.sponsor_companies (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_companies enable ROW level security;

-- ネーミングライツスポンサー
CREATE TABLE public.sponsor_naming_rights (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_naming_rights enable ROW level security;

-- ネームプレートスポンサー
CREATE TABLE public.sponsor_nameplate (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_nameplate enable ROW level security;

-- ランチスポンサー
CREATE TABLE public.sponsor_lunch (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_lunch enable ROW level security;

-- スカラーシップスポンサー
CREATE TABLE public.sponsor_scholarship (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_scholarship enable ROW level security;
