CREATE TABLE public.sponsors_nameplate (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT UNIQUE REFERENCES public.companies(id) ON DELETE CASCADE
);

ALTER TABLE public.sponsors_nameplate ENABLE ROW LEVEL SECURITY;
