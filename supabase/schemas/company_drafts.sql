CREATE TABLE public.company_drafts (
  id SMALLSERIAL PRIMARY KEY,
  company_id SMALLINT REFERENCES public.companies(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  name_en TEXT,
  logo_name TEXT,
  created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
  approved_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT now() NOT NULL,
  updated_at TIMESTAMP DEFAULT now() NOT NULL
);

ALTER TABLE public.company_drafts ENABLE ROW LEVEL SECURITY;

-- 更新時にupdated_atを更新する
CREATE TRIGGER update_company_drafts_updated_at
BEFORE UPDATE ON public.company_drafts
FOR EACH ROW EXECUTE FUNCTION moddatetime(updated_at);
