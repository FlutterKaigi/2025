CREATE TABLE public.companies (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name text NOT NULL CHECK (name <> ''),
  logo_name text,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.companies enable ROW level security;
