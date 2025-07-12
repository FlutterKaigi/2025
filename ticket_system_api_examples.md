# チケットシステム API 仕様書

FlutterKaigi 2025 チケット管理システムのAPI仕様書です。

## 概要

このシステムは以下の機能を提供します：

- チケット種別の管理
- チケット購入処理
- Stripe決済連携
- 管理者によるチケット発行
- 学生向け特別対応
- チケット状態の取得

## API エンドポイント

### 1. チケット状態取得 API

チケットの販売状況を取得します。

```http
GET /api/tickets/status
```

**レスポンス例:**
```json
{
  "tickets": [
    {
      "id": 1,
      "name": "early_bird",
      "price": 6000,
      "max_quantity": 450,
      "sold_count": 123,
      "description": "アーリーバード特典付き。前夜祭参加権、ネームプレート印刷サービス含む",
      "sale_start_at": "2025-07-28T00:00:00+09:00",
      "sale_end_at": "2025-08-24T23:59:59+09:00",
      "status": "available"
    },
    {
      "id": 2,
      "name": "normal",
      "price": 8000,
      "max_quantity": null,
      "sold_count": 0,
      "description": "通常価格チケット。ネームプレートは手書き枠提供",
      "sale_start_at": "2025-08-25T00:00:00+09:00",
      "sale_end_at": "2025-10-31T23:59:59+09:00",
      "status": "not_started"
    }
  ]
}
```

**ステータス値:**
- `available`: 販売中
- `not_started`: 販売開始前
- `ended`: 販売終了
- `sold_out`: 完売
- `inactive`: 販売停止

### 2. チケット購入 API

チケットを購入します。

```http
POST /api/tickets/purchase
```

**リクエスト例:**
```json
{
  "ticket_type_id": 1,
  "quantity": 1,
  "options": [
    {
      "ticket_option_id": 1,
      "option_value": "田中太郎"
    },
    {
      "ticket_option_id": 3,
      "option_value": "参加希望"
    }
  ],
  "coupon_code": null
}
```

**レスポンス例:**
```json
{
  "purchase_id": 123,
  "status": "pending",
  "total_amount": 6000,
  "stripe_payment_intent_id": "pi_1234567890",
  "client_secret": "pi_1234567890_secret_abc123"
}
```

### 3. Stripe Webhook エンドポイント

Stripeからの決済完了通知を受け取ります。

```http
POST /api/webhooks/stripe
```

**処理内容:**
1. Webhookイベントの検証
2. 決済完了時のチケット購入ステータス更新
3. 重複処理の防止

### 4. 管理者チケット発行 API

管理者が手動でチケットを発行します。

```http
POST /api/admin/tickets/issue
Authorization: Bearer <admin_token>
```

**リクエスト例:**
```json
{
  "user_id": "uuid-of-user",
  "ticket_type_id": 5,
  "quantity": 1,
  "notes": "スポンサー招待チケット",
  "options": [
    {
      "ticket_option_id": 10,
      "option_value": "スポンサー太郎"
    }
  ]
}
```

## データベース設計のポイント

### 1. 既存システムとの整合性

- `users` テーブル: 既存のUUID主キーを参照
- 命名規則: `smallint` for ID, `text` for strings, `timestamp` for dates
- ROW Level Security: 全テーブルで有効化

### 2. 柔軟なオプション管理

- `ticket_options`: チケット種別ごとのオプション定義
- `ticket_purchase_options`: 購入時のオプション値保存
- JSONB型での選択肢管理

### 3. 決済システム連携

- Stripe決済ID保存
- Webhook処理ログ
- 重複処理防止

### 4. 学生向け特別対応

学生向けチケットは以下の流れで処理されます：

1. 学生が通常価格でチケット購入
2. 学生証画像をアップロード
3. 管理者が学生証を確認
4. 承認後、Stripe APIで返金処理

## 使用例

### チケット状態確認

```sql
-- チケット状態ビューから情報取得
SELECT * FROM public.ticket_status WHERE is_active = true;
```

### 購入処理

```sql
-- 1. チケット購入レコード作成
INSERT INTO public.ticket_purchases (
    user_id, ticket_type_id, quantity, unit_price, total_amount, 
    status, payment_method, stripe_payment_intent_id
) VALUES (
    'user-uuid', 1, 1, 6000, 6000, 
    'pending', 'stripe', 'pi_1234567890'
);

-- 2. オプション保存
INSERT INTO public.ticket_purchase_options (
    ticket_purchase_id, ticket_option_id, option_value
) VALUES 
    (1, 1, '田中太郎'),
    (1, 3, '参加希望');
```

### Webhook処理

```sql
-- 1. Webhookログ保存
INSERT INTO public.stripe_webhook_logs (
    stripe_event_id, event_type, payment_intent_id, raw_data
) VALUES (
    'evt_1234567890', 'payment_intent.succeeded', 'pi_1234567890', '{...}'::jsonb
);

-- 2. 購入ステータス更新
UPDATE public.ticket_purchases 
SET status = 'completed', purchased_at = now()
WHERE stripe_payment_intent_id = 'pi_1234567890';
```

## セキュリティ考慮事項

1. **ROW Level Security**: 全テーブルで有効化
2. **Webhook検証**: Stripeシグネチャ検証必須
3. **管理者権限**: 管理者APIは適切な認証必須
4. **個人情報保護**: 学生証画像は適切な暗号化と保存期間制限

## 運用上の注意点

1. **販売数制限**: `max_quantity` を超える販売を防ぐ排他制御
2. **重複決済防止**: 同一ユーザーの重複購入チェック
3. **クーポン管理**: 使用回数制限と有効期限チェック
4. **学生支援**: 返金処理の自動化と追跡
