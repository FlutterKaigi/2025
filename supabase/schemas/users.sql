
CREATE TABLE public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT now() NOT NULL
);

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Supabase Auth　にユーザが追加されたときに profiles テーブルに追加する
CREATE FUNCTION public.handle_new_user () returns trigger language plpgsql security definer
SET
  search_path = public AS $$
begin
  insert into public.profiles (id)
  values (new.id);
  return new;
end;
$$;

CREATE TRIGGER on_auth_user_created
AFTER insert ON auth.users FOR each ROW
EXECUTE procedure public.handle_new_user ();
