CREATE TABLE public.sponsors_basic (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT UNIQUE REFERENCES public.companies(id) ON DELETE CASCADE,
  basic_plan public.basic_plan NOT NULL
);

ALTER TABLE public.sponsors_basic ENABLE ROW LEVEL SECURITY;
