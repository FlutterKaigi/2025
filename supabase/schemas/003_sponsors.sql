CREATE TABLE public.sponsor_individuals (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  individual_id smallint REFERENCES public.individuals (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_individuals enable ROW level security;

CREATE TABLE public.sponsor_naming_rights (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_naming_rights enable ROW level security;

CREATE TABLE public.sponsor_nameplate (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_nameplate enable ROW level security;

CREATE TABLE public.sponsor_lunch (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_lunch enable ROW level security;

CREATE TABLE public.sponsor_scholarship (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.sponsor_scholarship enable ROW level security;
