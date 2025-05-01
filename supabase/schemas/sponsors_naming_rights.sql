CREATE TABLE public.sponsors_naming_rights (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT UNIQUE REFERENCES public.companies(id) ON DELETE CASCADE
);

ALTER TABLE public.sponsors_naming_rights ENABLE ROW LEVEL SECURITY;
