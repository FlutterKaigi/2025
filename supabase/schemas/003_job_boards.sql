CREATE TABLE public.job_boards (
    id smallint PRIMARY KEY REFERENCES public.companies (id) ON DELETE CASCADE,
    url text NOT NULL UNIQUE CHECK (url ~* '^https?://'),
    alt_text text NOT NULL CHECK (alt_text <> ''),
    image_name text NOT NULL CHECK (image_name <> '')
);

ALTER TABLE public.job_boards enable ROW level security;
