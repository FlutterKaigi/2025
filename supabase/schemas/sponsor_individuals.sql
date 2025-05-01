CREATE TABLE public.sponsor_individuals (
  id SMALLSERIAL PRIMARY KEY,
  individual_id INTEGER UNIQUE REFERENCES public.individuals(id) ON DELETE CASCADE
);

ALTER TABLE public.sponsor_individuals ENABLE ROW LEVEL SECURITY;
