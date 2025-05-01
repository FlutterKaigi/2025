CREATE TABLE public.user_companies (
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  company_id SMALLINT REFERENCES public.companies(id) ON DELETE CASCADE,
  PRIMARY KEY(user_id, company_id)
);

ALTER TABLE public.user_companies ENABLE ROW LEVEL SECURITY;
