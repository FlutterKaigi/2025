-- チケットシステム スキーマ
-- FlutterKaigi 2025 チケット管理システム

-- ========================================
-- 1. チケット種別マスタテーブル
-- ========================================
CREATE TABLE public.ticket_types (
    id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL, -- 'early_bird', 'normal', 'personal_sponsor' など
    price integer NOT NULL, -- 価格（円）
    max_quantity integer, -- 最大販売枚数（NULLは無制限）
    description text, -- 概要（Markdown対応）
    is_active boolean DEFAULT true, -- 販売可能フラグ
    sale_start_at timestamp with time zone, -- 販売開始時刻
    sale_end_at timestamp with time zone, -- 販売終了時刻
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_types enable ROW level security;

-- ========================================
-- 2. チケットオプションマスタテーブル
-- ========================================
CREATE TABLE public.ticket_options (
    id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ticket_type_id smallint NOT NULL REFERENCES public.ticket_types(id) ON DELETE CASCADE,
    name text NOT NULL, -- オプション名
    description text, -- オプション説明
    is_required boolean DEFAULT false, -- 必須オプションかどうか
    option_type text NOT NULL, -- 'boolean', 'text', 'image', 'select' など
    option_values jsonb, -- 選択肢がある場合の値（JSON形式）
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_options enable ROW level security;

-- ========================================
-- 3. チケット購入テーブル
-- ========================================
CREATE TYPE public.ticket_purchase_status AS enum('pending', 'completed', 'cancelled', 'refunded');
CREATE TYPE public.payment_method AS enum('stripe', 'admin_issued', 'coupon');

CREATE TABLE public.ticket_purchases (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id uuid NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    ticket_type_id smallint NOT NULL REFERENCES public.ticket_types(id) ON DELETE CASCADE,
    quantity integer NOT NULL DEFAULT 1,
    unit_price integer NOT NULL, -- 購入時の単価
    total_amount integer NOT NULL, -- 総額
    status public.ticket_purchase_status NOT NULL DEFAULT 'pending',
    payment_method public.payment_method,
    stripe_payment_intent_id text, -- Stripe決済ID
    coupon_code text, -- 使用クーポンコード
    purchase_notes text, -- 購入メモ（管理者発行時など）
    purchased_at timestamp DEFAULT now() NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.ticket_purchases enable ROW level security;

-- ========================================
-- 4. チケット購入オプションテーブル
-- ========================================
CREATE TABLE public.ticket_purchase_options (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ticket_purchase_id integer NOT NULL REFERENCES public.ticket_purchases(id) ON DELETE CASCADE,
    ticket_option_id smallint NOT NULL REFERENCES public.ticket_options(id) ON DELETE CASCADE,
    option_value text, -- テキスト値、画像URL、選択値など
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL,
    UNIQUE(ticket_purchase_id, ticket_option_id)
);

ALTER TABLE public.ticket_purchase_options enable ROW level security;

-- ========================================
-- 5. クーポンテーブル
-- ========================================
CREATE TYPE public.discount_type AS enum('percentage', 'fixed_amount', 'free');

CREATE TABLE public.coupons (
    id smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code text UNIQUE NOT NULL,
    name text NOT NULL,
    discount_type public.discount_type NOT NULL,
    discount_value integer, -- 割引額または割引率
    applicable_ticket_types smallint[], -- 適用可能チケット種別ID配列
    max_uses integer, -- 最大使用回数（NULLは無制限）
    used_count integer DEFAULT 0, -- 使用回数
    valid_from timestamp with time zone,
    valid_until timestamp with time zone,
    is_active boolean DEFAULT true,
    created_by uuid REFERENCES public.users(id) ON DELETE SET NULL, -- 作成者
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.coupons enable ROW level security;

-- ========================================
-- 6. Stripe Webhookログテーブル
-- ========================================
CREATE TABLE public.stripe_webhook_logs (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    stripe_event_id text UNIQUE NOT NULL,
    event_type text NOT NULL,
    payment_intent_id text,
    processed boolean DEFAULT false,
    error_message text,
    raw_data jsonb NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.stripe_webhook_logs enable ROW level security;

-- ========================================
-- インデックス作成
-- ========================================
CREATE INDEX idx_ticket_purchases_user_id ON public.ticket_purchases(user_id);
CREATE INDEX idx_ticket_purchases_ticket_type_id ON public.ticket_purchases(ticket_type_id);
CREATE INDEX idx_ticket_purchases_status ON public.ticket_purchases(status);
CREATE INDEX idx_ticket_purchases_stripe_payment_intent_id ON public.ticket_purchases(stripe_payment_intent_id);
CREATE INDEX idx_ticket_purchase_options_ticket_purchase_id ON public.ticket_purchase_options(ticket_purchase_id);
CREATE INDEX idx_stripe_webhook_logs_stripe_event_id ON public.stripe_webhook_logs(stripe_event_id);
CREATE INDEX idx_stripe_webhook_logs_processed ON public.stripe_webhook_logs(processed);

-- ========================================
-- チケット状態取得用ビュー
-- ========================================
CREATE VIEW public.ticket_status AS
SELECT 
    tt.id,
    tt.name,
    tt.price,
    tt.max_quantity,
    COALESCE(sold.sold_count, 0) as sold_count,
    tt.description,
    tt.sale_start_at,
    tt.sale_end_at,
    tt.is_active,
    CASE 
        WHEN tt.sale_start_at IS NOT NULL AND now() < tt.sale_start_at THEN 'not_started'
        WHEN tt.sale_end_at IS NOT NULL AND now() > tt.sale_end_at THEN 'ended'
        WHEN tt.max_quantity IS NOT NULL AND COALESCE(sold.sold_count, 0) >= tt.max_quantity THEN 'sold_out'
        WHEN tt.is_active = false THEN 'inactive'
        ELSE 'available'
    END as status
FROM public.ticket_types tt
LEFT JOIN (
    SELECT 
        ticket_type_id,
        SUM(quantity) as sold_count
    FROM public.ticket_purchases 
    WHERE status = 'completed'
    GROUP BY ticket_type_id
) sold ON tt.id = sold.ticket_type_id;
