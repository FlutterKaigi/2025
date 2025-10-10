# FCM Internal API

FlutterKaigi 2025 の FCM（Firebase Cloud Messaging）通知配信を行うための内部 API です。

## 概要

この API は、Firebase Admin SDK を使用して、FCM 経由でプッシュ通知をバッチ送信するための内部サービスです。

## 機能

- **Batch API**: 複数の FCM メッセージを一括送信
- **認証**: `Proxy-Authorization` ヘッダーによる API キー認証
- **ヘルスチェック**: サービスの稼働状況を確認するエンドポイント

## 環境変数

以下の環境変数を設定する必要があります：

- `X_API_KEY`: API 認証用のキー（必須）
- `FIREBASE_SERVICE_ACCOUNT_JSON`: Firebase サービスアカウントの JSON 文字列（必須）
- `PORT`: サーバーのポート番号（デフォルト: 8080）

## API エンドポイント

### POST /batch/send

複数の FCM メッセージをバッチ送信します。

**Headers:**
```
Proxy-Authorization: <X_API_KEY の値>
Content-Type: application/json
```

**Request Body:**

このエンドポイントは、Firebase Admin SDK の [Message](https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.message) 型と完全に互換性のあるスキーマを使用します。

```json
{
  "messages": [
    {
      "token": "device_token_here",
      "notification": {
        "title": "通知のタイトル",
        "body": "通知の本文",
        "imageUrl": "https://example.com/image.png"
      },
      "data": {
        "key1": "value1",
        "key2": "value2"
      },
      "android": {
        "priority": "high",
        "notification": {
          "title": "Android 専用タイトル",
          "body": "Android 専用本文",
          "channelId": "default_channel",
          "sound": "default",
          "color": "#FF0000",
          "icon": "ic_notification"
        }
      },
      "apns": {
        "headers": {
          "apns-priority": "10"
        },
        "payload": {
          "aps": {
            "alert": {
              "title": "iOS 専用タイトル",
              "body": "iOS 専用本文"
            },
            "sound": "default",
            "badge": 1
          }
        }
      },
      "webpush": {
        "notification": {
          "title": "Web 専用タイトル",
          "body": "Web 専用本文",
          "icon": "https://example.com/icon.png"
        }
      },
      "fcmOptions": {
        "analyticsLabel": "campaign_1"
      }
    }
  ],
  "validateOnly": false
}
```

**サポートされるフィールド:**

- `token`, `topic`, `condition`: ターゲット指定（いずれか1つ必須）
- `notification`: 共通通知ペイロード
- `data`: カスタムデータ（キー・バリュー形式）
- `android`: Android 固有の設定（[AndroidConfig](https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.androidconfig)）
- `apns`: iOS 固有の設定（[ApnsConfig](https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.apnsconfig)）
- `webpush`: Web Push 固有の設定（[WebpushConfig](https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.webpushconfig)）
- `fcmOptions`: FCM オプション
- `validateOnly`: true の場合、メッセージを送信せずに検証のみ行う

**Response:**
```json
{
  "successCount": 1,
  "failureCount": 0,
  "results": [
    {
      "success": true,
      "messageId": "projects/...",
      "token": "device_token_here"
    }
  ]
}
```

### GET /health

ヘルスチェックエンドポイント

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2025-10-10T00:00:00.000Z"
}
```

## 開発

### セットアップ

```bash
cd bff/fcm-internal-api
bun install
```

### 開発サーバーの起動

```bash
bun run dev
```

### 本番ビルド

```bash
bun run start
```

### Lint & Format

```bash
bun run format
```

### 型チェック

```bash
bun run check-types
```

## Docker

### ビルド

```bash
docker build -t fcm-internal-api .
```

### 実行

```bash
docker run -p 8080:8080 \
  -e X_API_KEY="your_api_key" \
  -e FIREBASE_SERVICE_ACCOUNT_JSON='{"type":"service_account",...}' \
  fcm-internal-api
```

## セキュリティ

- すべてのリクエストは `Proxy-Authorization` ヘッダーで認証されます
- API キーは環境変数 `X_API_KEY` と一致する必要があります
- Firebase サービスアカウントの認証情報は適切に保護してください
