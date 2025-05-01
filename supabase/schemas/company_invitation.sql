CREATE TABLE public.company_invitation (
  company_id SMALLINT PRIMARY KEY REFERENCES public.companies(id) ON DELETE CASCADE,
  key TEXT NOT NULL
);

ALTER TABLE public.company_invitation ENABLE ROW LEVEL SECURITY;
