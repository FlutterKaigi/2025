CREATE TABLE public.sponsors_lunch (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT UNIQUE REFERENCES public.companies(id) ON DELETE CASCADE
);

ALTER TABLE public.sponsors_lunch ENABLE ROW LEVEL SECURITY;
