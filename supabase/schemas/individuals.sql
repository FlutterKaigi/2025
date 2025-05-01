CREATE TABLE public.individuals (
  id SERIAL PRIMARY KEY,
  user_id UUID UNIQUE REFERENCES public.users(id) ON DELETE CASCADE
);

ALTER TABLE public.individuals ENABLE ROW LEVEL SECURITY;
