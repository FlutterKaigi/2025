CREATE TYPE public.role AS enum('admin', 'staff', 'sponsor', 'speaker', 'viewer', 'attendee');

CREATE TABLE public.user_roles (
  user_id uuid REFERENCES public.users (id) ON DELETE CASCADE,
  role public.role NOT NULL,
  created_at timestamp DEFAULT current_timestamp NOT NULL,
  PRIMARY KEY (user_id, role)
);

ALTER TABLE public.user_roles enable ROW level security;
