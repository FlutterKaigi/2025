CREATE TYPE public.role AS ENUM (
  'admin',
  'staff',
  'sponsor',
  'speaker',
  'viewer',
  'attendee'
);

CREATE TABLE public.user_roles (
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  role public.role NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY(user_id, role)
);

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;
