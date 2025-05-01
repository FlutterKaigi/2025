CREATE TABLE public.sponsors_scholarship (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT UNIQUE REFERENCES public.companies(id) ON DELETE CASCADE
);

ALTER TABLE public.sponsors_scholarship ENABLE ROW LEVEL SECURITY;
