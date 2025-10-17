CREATE TABLE public.users (
  id uuid PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL,
  deleted_at timestamp DEFAULT NULL
);

ALTER TABLE public.users enable ROW level security;

-- Supabase Auth　にユーザが追加されたときに users テーブルに追加する
CREATE FUNCTION public.handle_new_user () returns trigger language plpgsql security definer
SET
  search_path = public AS $$
begin
  insert into public.users (id)
  values (new.id);
  return new;
end;
$$;

CREATE TRIGGER on_auth_user_created
AFTER insert ON auth.users FOR each ROW
EXECUTE procedure public.handle_new_user ();
