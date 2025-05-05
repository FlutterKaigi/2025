CREATE TABLE public.individuals (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id uuid REFERENCES public.users (id) ON DELETE CASCADE UNIQUE,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.individuals enable ROW level security;
