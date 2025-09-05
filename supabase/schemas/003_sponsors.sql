-- 企業スポンサーの種類
CREATE TYPE public.company_sponsor_type AS enum('basic', 'community', 'tool', 'none');

-- ベーシックプランの種類
CREATE TYPE public.basic_plan_type AS enum('platinum', 'gold', 'silver', 'bronze');

-- オプションプランの種類
CREATE TYPE public.option_plan_type AS enum('naming_rights_hall', 'naming_rights_room', 'nameplate', 'lunch', 'scholarship');

-- 企業スポンサー
CREATE TABLE public.sponsor_companies (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  company_id smallint REFERENCES public.companies (id) ON DELETE CASCADE,
  sponsor_type public.company_sponsor_type NOT NULL,
  display_order text NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL
);

-- ベーシックスポンサー専用テーブル
CREATE TABLE public.basic_sponsor_companies (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  sponsor_company_id smallint REFERENCES public.sponsor_companies (id) ON DELETE CASCADE,
  basic_plan_type public.basic_plan_type NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  UNIQUE (sponsor_company_id)
);

-- 企業スポンサーのオプションプラン契約
CREATE TABLE public.sponsor_company_options (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  sponsor_company_id smallint REFERENCES public.sponsor_companies (id) ON DELETE CASCADE,
  option_plan_type public.option_plan_type NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  UNIQUE (sponsor_company_id, option_plan_type)
);

-- 個人スポンサー
CREATE TABLE public.sponsor_individuals (
  id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  individual_id smallint REFERENCES public.individuals (id) ON DELETE CASCADE,
  created_at timestamp DEFAULT now() NOT NULL
);

-- 制約チェック用ファンクション
CREATE OR REPLACE FUNCTION check_option_plan_availability (p_basic_plan_type public.basic_plan_type, p_option_plan_type public.option_plan_type) returns boolean AS $$
BEGIN
  -- スカラシップは全プラン利用可能
  IF p_option_plan_type = 'scholarship' THEN
    RETURN TRUE;
  END IF;
  
  -- ネーミングライツ（ホール）：silver以上限定
  IF p_option_plan_type = 'naming_rights_hall' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネーミングライツ（ルーム）：silver以上限定
  IF p_option_plan_type = 'naming_rights_room' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネームプレート：ブロンズ以上限定
  IF p_option_plan_type = 'nameplate' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver', 'bronze');
  END IF;
  
  -- 弁当：シルバー・ブロンズ限定
  IF p_option_plan_type = 'lunch' THEN
    RETURN p_basic_plan_type IN ('silver', 'bronze');
  END IF;
  
  RETURN FALSE;
END;
$$ language plpgsql;

-- オプションプラン追加時の制約チェック用トリガー
CREATE OR REPLACE FUNCTION check_sponsor_option_constraint () returns trigger AS $$
DECLARE
  v_basic_plan_type public.basic_plan_type;
  v_sponsor_type public.company_sponsor_type;
BEGIN
  -- スポンサータイプを取得
  SELECT sc.sponsor_type
  INTO v_sponsor_type
  FROM sponsor_companies sc
  WHERE sc.id = NEW.sponsor_company_id;

  IF v_sponsor_type != 'basic' THEN
    IF NEW.option_plan_type != 'scholarship' THEN
      RAISE EXCEPTION 'ベーシックスポンサーではない場合、スカラーシップスポンサー以外は利用できません。';
    END IF;
    RETURN NEW;
  END IF;

  -- ベーシックスポンサーの場合、プラン制約をチェック
  SELECT bsc.basic_plan_type
  INTO v_basic_plan_type
  FROM basic_sponsor_companies bsc
  WHERE bsc.sponsor_company_id = NEW.sponsor_company_id;

  IF NOT check_option_plan_availability(v_basic_plan_type, NEW.option_plan_type) THEN
    RAISE EXCEPTION 'このプランでは利用できないオプションです';
  END IF;

  RETURN NEW;
END;
$$ language plpgsql;

-- トリガーの作成
CREATE TRIGGER check_sponsor_option_constraint_trigger before insert
OR
UPDATE ON sponsor_company_options FOR each ROW
EXECUTE function check_sponsor_option_constraint ();

-- RLS設定
ALTER TABLE public.sponsor_companies enable ROW level security;

ALTER TABLE public.basic_sponsor_companies enable ROW level security;

ALTER TABLE public.sponsor_company_options enable ROW level security;

ALTER TABLE public.sponsor_individuals enable ROW level security;
