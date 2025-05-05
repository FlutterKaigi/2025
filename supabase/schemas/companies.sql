CREATE TABLE public.companies (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.companies enable ROW level security;
