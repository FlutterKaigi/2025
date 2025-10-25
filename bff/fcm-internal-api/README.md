# FCM Internal API

FlutterKaigi 2025 の FCM（Firebase Cloud Messaging）通知配信を行うための内部 API です。

## 概要

この API は、Firebase Admin SDK を使用して、FCM 経由でプッシュ通知をバッチ送信するための内部サービスです。

> [!WARNING]
>
> 本プロジェクトの`Dockerfile`により生成されるイメージには、Google CloudのService Accountが含まれています。
> イメージは必ず公開しないようにしてください。
> (App Runの制約により、実行時の環境変数にセットすることができないため、イメージに焼き付けています)

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
