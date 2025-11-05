-- FlutterKaigiのスタッフメンバーを管理するテーブル
CREATE TABLE public.staff_members (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
    name text NOT NULL CHECK (char_length(trim(name)) > 0),
    icon_name text NOT NULL CHECK (char_length(trim(icon_name)) > 0),
    greeting text,
    created_at timestamp DEFAULT current_timestamp NOT NULL,
    updated_at timestamp DEFAULT current_timestamp NOT NULL
);

ALTER TABLE public.staff_members enable ROW level security;

-- FlutterKaigiのスタッフメンバーのSNSリンクテーブル
CREATE TABLE public.staff_member_sns_links (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
    staff_member_id uuid NOT NULL REFERENCES public.staff_members (id) ON DELETE CASCADE,
    sns_type public.sns_type NOT NULL,
    value text NOT NULL CHECK (char_length(trim(value)) > 0),
    created_at timestamp DEFAULT current_timestamp NOT NULL,
    updated_at timestamp DEFAULT current_timestamp NOT NULL,
    UNIQUE (staff_member_id, sns_type)
);

ALTER TABLE public.staff_member_sns_links enable ROW level security;

-- staff_membersテーブルのupdated_atトリガー
CREATE TRIGGER update_staff_members_updated_at before
UPDATE ON public.staff_members FOR each ROW
EXECUTE function public.update_updated_at_column ();

-- staff_member_sns_linksテーブルのupdated_atトリガー
CREATE TRIGGER update_staff_member_sns_links_updated_at before
UPDATE ON public.staff_member_sns_links FOR each ROW
EXECUTE function public.update_updated_at_column ();
