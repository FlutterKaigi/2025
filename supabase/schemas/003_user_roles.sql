CREATE TYPE public.role AS enum('admin', 'staff', 'sponsor', 'speaker', 'viewer', 'attendee');

CREATE TABLE public.user_roles (
  user_id uuid REFERENCES public.users (id) ON DELETE CASCADE,
  role public.role NOT NULL,
  created_at timestamp DEFAULT current_timestamp NOT NULL,
  PRIMARY KEY (user_id, role)
);

ALTER TABLE public.user_roles enable ROW level security;

CREATE OR REPLACE FUNCTION public.upsert_user_roles (p_user_id uuid, roles public.role[]) returns query AS $$
BEGIN
  DELETE FROM public.user_roles AS ur WHERE ur.user_id = p_user_id;

  IF array_length(roles, 1) IS NOT NULL THEN
    INSERT INTO public.user_roles (user_id, role)
    SELECT p_user_id, unnest_val FROM unnest(roles) AS unnest_val;
  END IF;

  RETURN QUERY
  SELECT
    u.id,
    u.created_at,
    array_agg(ur.role) FILTER (WHERE ur.role IS NOT NULL) AS roles
  FROM
    public.users AS u
    LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
  WHERE
    u.id = p_user_id
  GROUP BY u.id, u.created_at;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION public.replace_user_roles (p_user_id uuid, p_roles public.role[]) returns void AS $$
BEGIN
  DELETE FROM public.user_roles WHERE user_id = p_user_id;

  IF array_length(p_roles, 1) IS NOT NULL THEN
    INSERT INTO public.user_roles (user_id, role)
    SELECT p_user_id, unnest(p_roles);
  END IF;
END;
$$ language plpgsql;
