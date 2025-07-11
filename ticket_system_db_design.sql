-- チケットシステム DB設計
-- FlutterKaigi 2024 チケット管理システム

-- ========================================
-- 1. チケット種別マスタテーブル
-- ========================================
CREATE TABLE ticket_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL, -- 'アーリーバード', 'ノーマル', '個人スポンサー' など
    display_name VARCHAR(100) NOT NULL, -- 表示用名称
    price INTEGER NOT NULL, -- 価格（円）
    max_quantity INTEGER, -- 最大販売枚数（NULLは無制限）
    description TEXT, -- 概要（Markdown対応）
    is_active BOOLEAN DEFAULT true, -- 販売可能フラグ
    requires_payment BOOLEAN DEFAULT true, -- 決済必要フラグ
    requires_coupon BOOLEAN DEFAULT false, -- クーポン必要フラグ
    sale_start_at TIMESTAMP WITH TIME ZONE, -- 販売開始時刻
    sale_end_at TIMESTAMP WITH TIME ZONE, -- 販売終了時刻
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- 2. チケットオプションマスタテーブル
-- ========================================
CREATE TABLE ticket_options (
    id SERIAL PRIMARY KEY,
    ticket_type_id INTEGER NOT NULL REFERENCES ticket_types(id),
    option_key VARCHAR(50) NOT NULL, -- 'nameplate_custom', 'avatar_upload', 'priority_seat' など
    option_name VARCHAR(100) NOT NULL, -- オプション名
    option_description TEXT, -- オプション説明
    is_required BOOLEAN DEFAULT false, -- 必須オプションかどうか
    option_type VARCHAR(20) NOT NULL, -- 'boolean', 'text', 'image', 'select' など
    option_values JSONB, -- 選択肢がある場合の値（JSON形式）
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(ticket_type_id, option_key)
);

-- ========================================
-- 3. ユーザーテーブル
-- ========================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100),
    avatar_url VARCHAR(500),
    stripe_customer_id VARCHAR(100), -- Stripe顧客ID
    is_student BOOLEAN DEFAULT false, -- 学生フラグ
    student_verification_status VARCHAR(20), -- 'pending', 'verified', 'rejected'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- 4. チケット購入テーブル
-- ========================================
CREATE TABLE ticket_purchases (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    ticket_type_id INTEGER NOT NULL REFERENCES ticket_types(id),
    quantity INTEGER NOT NULL DEFAULT 1,
    unit_price INTEGER NOT NULL, -- 購入時の単価
    total_amount INTEGER NOT NULL, -- 総額
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- 'pending', 'completed', 'cancelled', 'refunded'
    payment_method VARCHAR(20), -- 'stripe', 'admin_issued', 'coupon'
    stripe_payment_intent_id VARCHAR(100), -- Stripe決済ID
    coupon_code VARCHAR(50), -- 使用クーポンコード
    purchase_notes TEXT, -- 購入メモ（管理者発行時など）
    purchased_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- 5. チケット購入オプションテーブル
-- ========================================
CREATE TABLE ticket_purchase_options (
    id SERIAL PRIMARY KEY,
    ticket_purchase_id INTEGER NOT NULL REFERENCES ticket_purchases(id),
    option_key VARCHAR(50) NOT NULL,
    option_value TEXT, -- テキスト値、画像URL、選択値など
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(ticket_purchase_id, option_key)
);

-- ========================================
-- 6. クーポンテーブル
-- ========================================
CREATE TABLE coupons (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    discount_type VARCHAR(20) NOT NULL, -- 'percentage', 'fixed_amount', 'free'
    discount_value INTEGER, -- 割引額または割引率
    applicable_ticket_types INTEGER[], -- 適用可能チケット種別ID配列
    max_uses INTEGER, -- 最大使用回数（NULLは無制限）
    used_count INTEGER DEFAULT 0, -- 使用回数
    valid_from TIMESTAMP WITH TIME ZONE,
    valid_until TIMESTAMP WITH TIME ZONE,
    is_active BOOLEAN DEFAULT true,
    created_by INTEGER REFERENCES users(id), -- 作成者
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- 7. 学生支援テーブル
-- ========================================
CREATE TABLE student_supports (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    ticket_purchase_id INTEGER NOT NULL REFERENCES ticket_purchases(id),
    support_type VARCHAR(20) NOT NULL, -- 'ticket_refund', 'transportation', 'accommodation'
    amount INTEGER NOT NULL, -- 支援金額
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- 'pending', 'approved', 'paid', 'rejected'
    application_data JSONB, -- 申請データ（交通費明細など）
    approval_notes TEXT, -- 承認メモ
    approved_by INTEGER REFERENCES users(id), -- 承認者
    approved_at TIMESTAMP WITH TIME ZONE,
    paid_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- 8. Stripe Webhookログテーブル
-- ========================================
CREATE TABLE stripe_webhook_logs (
    id SERIAL PRIMARY KEY,
    stripe_event_id VARCHAR(100) UNIQUE NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    payment_intent_id VARCHAR(100),
    processed BOOLEAN DEFAULT false,
    error_message TEXT,
    raw_data JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- インデックス作成
-- ========================================
CREATE INDEX idx_ticket_purchases_user_id ON ticket_purchases(user_id);
CREATE INDEX idx_ticket_purchases_ticket_type_id ON ticket_purchases(ticket_type_id);
CREATE INDEX idx_ticket_purchases_status ON ticket_purchases(status);
CREATE INDEX idx_ticket_purchases_stripe_payment_intent_id ON ticket_purchases(stripe_payment_intent_id);
CREATE INDEX idx_ticket_purchase_options_ticket_purchase_id ON ticket_purchase_options(ticket_purchase_id);
CREATE INDEX idx_student_supports_user_id ON student_supports(user_id);
CREATE INDEX idx_student_supports_status ON student_supports(status);
CREATE INDEX idx_stripe_webhook_logs_stripe_event_id ON stripe_webhook_logs(stripe_event_id);
CREATE INDEX idx_stripe_webhook_logs_processed ON stripe_webhook_logs(processed);

-- ========================================
-- 基本データ挿入
-- ========================================

-- チケット種別の基本データ
INSERT INTO ticket_types (name, display_name, price, max_quantity, description, sale_start_at, sale_end_at) VALUES
('early_bird', '一般（アーリー）', 6000, 450, 'アーリーバード特典付き。前夜祭参加権、ネームプレート印刷サービス含む', '2024-07-28 00:00:00+09', '2024-08-24 23:59:59+09'),
('normal', '一般（ノーマル）', 8000, NULL, '通常価格チケット。ネームプレートは手書き枠提供', '2024-08-25 00:00:00+09', '2024-10-31 23:59:59+09'),
('personal_sponsor', '個人スポンサー', 30000, 50, '個人スポンサー特典付き。優先席、アバター掲載、コメント発表含む', '2024-07-28 00:00:00+09', '2024-08-24 23:59:59+09'),
('hands_on', 'ハンズオン', 0, 44, 'ハンズオン参加チケット（要一般チケット）', '2024-07-28 00:00:00+09', NULL),
('sponsor_invitation', 'スポンサー招待', 0, 82, 'スポンサー招待チケット', '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09'),
('speaker', 'スピーカー', 0, 30, 'スピーカー招待チケット', '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09'),
('sponsor_session_speaker', 'スポンサーセッションスピーカー', 0, 4, 'スポンサーセッションスピーカー招待チケット', '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09'),
('pre_party_only', '前夜祭専用', 0, NULL, '前夜祭専用チケット（ノーマル購入者限定）', '2024-08-25 00:00:00+09', '2024-10-31 23:59:59+09'),
('student', '学生向け', 6000, NULL, '学生向けチケット（後日返金予定）', '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09');

-- チケットオプションの基本データ
INSERT INTO ticket_options (ticket_type_id, option_key, option_name, option_description, is_required, option_type) VALUES
-- アーリーバード用オプション
(1, 'nameplate_name', 'ネームプレート名前', 'ネームプレートに印刷する名前', true, 'text'),
(1, 'avatar_image', 'アバター画像', 'ネームプレートに印刷するアバター画像', false, 'image'),
(1, 'pre_party_attendance', '前夜祭参加希望', '前夜祭への参加希望', false, 'select'),
(1, 'comment', '意気込みコメント', '当日発表される意気込みコメント', false, 'text'),

-- 個人スポンサー用オプション
(2, 'sponsor_name', 'スポンサー名', 'ウェブサイト・アプリに掲載する名前', true, 'text'),
(2, 'sponsor_avatar', 'スポンサーアバター', 'ウェブサイト・アプリに掲載するアバター画像', false, 'image'),
(2, 'keynote_comment', 'キーノートコメント', 'キーノートで発表される意気込みコメント', false, 'text'),

-- 学生向け用オプション
(9, 'student_id_image', '学生証画像', '学生証明のための画像', true, 'image'),
(9, 'transportation_support', '交通費補助希望', '交通費補助の希望', false, 'boolean'),
(9, 'accommodation_support', '宿泊費補助希望', '宿泊費補助の希望', false, 'boolean');

-- 基本クーポン
INSERT INTO coupons (code, name, discount_type, discount_value, applicable_ticket_types, max_uses, valid_from, valid_until) VALUES
('SPONSOR_INVITATION', 'スポンサー招待', 'free', 0, ARRAY[5], NULL, '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09'),
('SPEAKER_INVITATION', 'スピーカー招待', 'free', 0, ARRAY[6], NULL, '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09'),
('SPONSOR_SESSION_SPEAKER', 'スポンサーセッションスピーカー招待', 'free', 0, ARRAY[7], NULL, '2024-07-28 00:00:00+09', '2024-10-31 23:59:59+09');
