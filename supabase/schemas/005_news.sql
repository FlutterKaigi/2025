CREATE TABLE public.news (
  id integer GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  title text NOT NULL,
  url text,
  starts_at timestamp NOT NULL,
  ends_at timestamp,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.news enable ROW level security;
