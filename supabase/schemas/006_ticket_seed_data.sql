-- チケットシステム 基本データ投入
-- FlutterKaigi 2025 チケット管理システム

-- ========================================
-- チケット種別の基本データ
-- ========================================
INSERT INTO public.ticket_types (name, price, max_quantity, description, sale_start_at, sale_end_at) VALUES
('early_bird', 6000, 450, 'アーリーバード特典付き。前夜祭参加権、ネームプレート印刷サービス含む', '2025-07-28 00:00:00+09', '2025-08-24 23:59:59+09'),
('normal', 8000, NULL, '通常価格チケット。ネームプレートは手書き枠提供', '2025-08-25 00:00:00+09', '2025-10-31 23:59:59+09'),
('personal_sponsor', 30000, 50, '個人スポンサー特典付き。優先席、アバター掲載、コメント発表含む', '2025-07-28 00:00:00+09', '2025-08-24 23:59:59+09'),
('hands_on', 0, 44, 'ハンズオン参加チケット（要一般チケット）', '2025-07-28 00:00:00+09', NULL),
('sponsor_invitation', 0, 82, 'スポンサー招待チケット', '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09'),
('speaker', 0, 30, 'スピーカー招待チケット', '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09'),
('sponsor_session_speaker', 0, 4, 'スポンサーセッションスピーカー招待チケット', '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09'),
('pre_party_only', 0, NULL, '前夜祭専用チケット（ノーマル購入者限定）', '2025-08-25 00:00:00+09', '2025-10-31 23:59:59+09'),
('student', 6000, NULL, '学生向けチケット（後日返金予定）', '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09');

-- ========================================
-- チケットオプションの基本データ
-- ========================================

-- アーリーバード用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(1, 'ネームプレート名前', 'ネームプレートに印刷する名前', true, 'text', NULL),
(1, 'アバター画像', 'ネームプレートに印刷するアバター画像', false, 'image', NULL),
(1, '前夜祭参加希望', '前夜祭への参加希望', false, 'select', '["参加希望", "不参加", "未定"]'::jsonb),
(1, '意気込みコメント', '当日発表される意気込みコメント', false, 'text', NULL);

-- ノーマル用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(2, 'ネームプレート手書き枠', 'ネームプレートの手書き枠に記入する内容', false, 'text', NULL);

-- 個人スポンサー用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(3, 'スポンサー名', 'ウェブサイト・アプリに掲載する名前', true, 'text', NULL),
(3, 'スポンサーアバター', 'ウェブサイト・アプリに掲載するアバター画像', false, 'image', NULL),
(3, 'キーノートコメント', 'キーノートで発表される意気込みコメント', false, 'text', NULL);

-- スピーカー用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(6, 'スピーカーアバター', 'ウェブサイト・アプリに掲載するアバター画像', false, 'image', NULL),
(6, 'スピーカー名', 'ウェブサイト・アプリに掲載する名前', true, 'text', NULL);

-- スポンサーセッションスピーカー用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(7, 'スピーカーアバター', 'ウェブサイト・アプリに掲載するアバター画像', false, 'image', NULL),
(7, 'スピーカー名', 'ウェブサイト・アプリに掲載する名前', true, 'text', NULL);

-- 学生向け用オプション
INSERT INTO public.ticket_options (ticket_type_id, name, description, is_required, option_type, option_values) VALUES
(9, '学生証画像', '学生証明のための画像', true, 'image', NULL),
(9, '交通費補助希望', '交通費補助の希望', false, 'boolean', NULL),
(9, '宿泊費補助希望', '宿泊費補助の希望', false, 'boolean', NULL);

-- ========================================
-- 基本クーポン
-- ========================================
INSERT INTO public.coupons (code, name, discount_type, discount_value, applicable_ticket_types, max_uses, valid_from, valid_until) VALUES
('SPONSOR_INVITATION', 'スポンサー招待', 'free', 0, ARRAY[5], NULL, '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09'),
('SPEAKER_INVITATION', 'スピーカー招待', 'free', 0, ARRAY[6], NULL, '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09'),
('SPONSOR_SESSION_SPEAKER', 'スポンサーセッションスピーカー招待', 'free', 0, ARRAY[7], NULL, '2025-07-28 00:00:00+09', '2025-10-31 23:59:59+09');
