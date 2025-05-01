CREATE TABLE public.individual_drafts (
  id SERIAL PRIMARY KEY,
  individual_id INTEGER REFERENCES public.individuals(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  logo_name TEXT,
  created_at TIMESTAMP DEFAULT now() NOT NULL,
  updated_at TIMESTAMP DEFAULT now() NOT NULL,
  approved_by UUID REFERENCES public.users(id) ON DELETE SET NULL
);

ALTER TABLE public.individual_drafts ENABLE ROW LEVEL SECURITY;

-- 更新時にupdated_atを更新する
CREATE TRIGGER update_individual_drafts_updated_at
BEFORE UPDATE ON public.individual_drafts
FOR EACH ROW EXECUTE FUNCTION moddatetime(updated_at);
