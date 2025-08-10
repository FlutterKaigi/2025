-- SNSの種類を定義するenum
CREATE TYPE public.sns_type AS enum('x', 'github', 'facebook', 'instagram', 'linkedin', 'youtube', 'tiktok', 'website');

-- プロファイルテーブル
CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  name text NOT NULL,
  comment text NOT NULL CHECK (char_length(comment) <= 100),
  is_adult boolean NOT NULL DEFAULT false,
  avatar_key text,
  created_at timestamp DEFAULT current_timestamp NOT NULL,
  updated_at timestamp DEFAULT current_timestamp NOT NULL
);

ALTER TABLE public.profiles enable ROW level security;

-- ユーザのSNSリンクテーブル
CREATE TABLE public.user_sns_links (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7(),
  user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  sns_type public.sns_type NOT NULL,
  value text NOT NULL CHECK (char_length(trim(value)) > 0),
  created_at timestamp DEFAULT current_timestamp NOT NULL,
  updated_at timestamp DEFAULT current_timestamp NOT NULL,
  UNIQUE (user_id, sns_type)
);

ALTER TABLE public.user_sns_links enable ROW level security;

-- updated_atを自動更新するトリガー関数
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = current_timestamp;
  RETURN NEW;
END;
$$ language plpgsql;

-- profilesテーブルのupdated_atトリガー
CREATE TRIGGER update_profiles_updated_at 
  BEFORE UPDATE ON public.profiles 
  FOR EACH ROW 
  EXECUTE FUNCTION public.update_updated_at_column();

-- user_sns_linksテーブルのupdated_atトリガー
CREATE TRIGGER update_user_sns_links_updated_at 
  BEFORE UPDATE ON public.user_sns_links 
  FOR EACH ROW 
  EXECUTE FUNCTION public.update_updated_at_column();