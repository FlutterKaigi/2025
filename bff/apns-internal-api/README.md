# APNs Internal API

FlutterKaigi 2025 の APNs（Apple Push Notification service）通知配信を行うための内部 API です。

## 概要

この API は、Vapor と APNSwift を使用して、APNs 経由でプッシュ通知と Live Activity の更新をバッチ送信するための内部サービスです。

## 技術スタック

- **Swift**: 6.0.3
- **Vapor**: 4.106.3+
- **APNSwift**: 4.1.0+

## 機能

- **プッシュ通知のバッチ送信**: 複数のプッシュ通知を一括送信
- **Live Activity のバッチ更新**: 複数の Live Activity を一括更新
- **認証**: `Proxy-Authorization` ヘッダーによる API キー認証
- **ヘルスチェック**: サービスの稼働状況を確認するエンドポイント
- **厳密な型定義**: Swift の型システムを活用した安全な実装
- **構造化ログ**: Vapor のロギングシステムによる詳細なログ出力

## 環境変数

以下の環境変数を設定する必要があります：

### 必須

- `X_API_KEY`: API 認証用のキー
- `APNS_KEY_ID`: APNs 認証キー ID
- `APNS_TEAM_ID`: Apple Developer Team ID
- `APNS_PRIVATE_KEY`: APNs 認証用の秘密鍵（PEM 形式の文字列）

### オプション

- `APNS_ENVIRONMENT`: APNs 環境 (`sandbox` or `production`, デフォルト: `sandbox`)
- `PORT`: サーバーのポート番号（デフォルト: 8080）
- `LOG_LEVEL`: ログレベル (`trace`, `debug`, `info`, `notice`, `warning`, `error`, `critical`, デフォルト: `info`)

## API エンドポイント

### GET /health

ヘルスチェックエンドポイント（認証不要）

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2025-10-10T00:00:00Z"
}
```

### POST /apns/push/batch

プッシュ通知をバッチ送信します。

**Headers:**
```
Proxy-Authorization: <X_API_KEY の値>
Content-Type: application/json
```

**Request Body:**
```json
{
  "notifications": [
    {
      "deviceToken": "device_token_here",
      "notification": {
        "title": "通知のタイトル",
        "subtitle": "サブタイトル",
        "body": "通知の本文",
        "badge": 1,
        "sound": "default",
        "category": "CATEGORY_NAME",
        "threadId": "thread-1"
      },
      "customData": {
        "key1": "value1",
        "key2": "value2"
      },
      "priority": 10,
      "expiration": 1696896000,
      "topic": "com.example.app",
      "collapseId": "collapse-id-1"
    }
  ],
  "validateOnly": false
}
```

**Response:**
```json
{
  "successCount": 1,
  "failureCount": 0,
  "results": [
    {
      "success": true,
      "apnsId": null,
      "deviceToken": "device_token_here",
      "error": null
    }
  ]
}
```

### POST /apns/live-activity/batch

Live Activity をバッチ更新します。

**Headers:**
```
Proxy-Authorization: <X_API_KEY の値>
Content-Type: application/json
```

**Request Body:**

#### Live Activity を開始する場合 (start イベント):
```json
{
  "updates": [
    {
      "deviceToken": "live_activity_push_token_here",
      "event": "start",
      "contentState": {
        "driverName": "田中太郎",
        "estimatedDeliveryTime": 1696896000,
        "status": "preparing"
      },
      "attributes": {
        "orderId": "ORDER-12345",
        "restaurantName": "レストラン名"
      },
      "attributesType": "DeliveryActivityAttributes",
      "alert": {
        "title": "配達が開始されました",
        "body": "田中太郎さんが配達を開始しました",
        "sound": "default"
      },
      "priority": 10,
      "timestamp": 1696896000,
      "staleDate": 1696899600,
      "relevanceScore": 0.9,
      "topic": "com.example.app.push-type.liveactivity"
    }
  ],
  "validateOnly": false
}
```

#### Live Activity を更新する場合 (update イベント):
```json
{
  "updates": [
    {
      "deviceToken": "live_activity_push_token_here",
      "event": "update",
      "contentState": {
        "driverName": "田中太郎",
        "estimatedDeliveryTime": 1696896300,
        "status": "on_the_way"
      },
      "alert": {
        "title": "配達状況が更新されました",
        "body": "あと5分で到着予定です",
        "sound": "default"
      },
      "priority": 10,
      "timestamp": 1696896200,
      "staleDate": 1696899600,
      "relevanceScore": 0.95,
      "topic": "com.example.app.push-type.liveactivity"
    }
  ],
  "validateOnly": false
}
```

#### Live Activity を終了する場合 (end イベント):
```json
{
  "updates": [
    {
      "deviceToken": "live_activity_push_token_here",
      "event": "end",
      "contentState": {
        "driverName": "田中太郎",
        "estimatedDeliveryTime": 1696896500,
        "status": "delivered"
      },
      "alert": {
        "title": "配達完了",
        "body": "ご注文の商品が配達されました",
        "sound": "default"
      },
      "priority": 10,
      "timestamp": 1696896500,
      "dismissalDate": 1696900100,
      "topic": "com.example.app.push-type.liveactivity"
    }
  ],
  "validateOnly": false
}
```

**フィールド説明:**

- `event`: イベントタイプ
  - `start`: Live Activity を開始（初回のみ）
  - `update`: Live Activity を更新
  - `end`: Live Activity を終了
- `contentState`: Live Activity の動的コンテンツ（任意の JSON オブジェクト）
- `attributes`: Live Activity の静的属性（`start` イベントでのみ使用）
- `attributesType`: 属性の型名（`start` イベントでのみ使用）
- `timestamp`: イベントのタイムスタンプ（Unix エポックからの秒数）
- `staleDate`: Live Activity が古くなる日時（Unix エポックからの秒数、オプション）
- `dismissalDate`: Live Activity を削除する日時（`end` イベントでのみ使用、Unix エポックからの秒数、オプション）
- `relevanceScore`: 関連性スコア（0.0 〜 1.0、オプション）
- `alert`: 通知アラート（オプション）
- `priority`: 優先度（10 = 即座、5 = 省電力）
- `topic`: バンドル ID に `.push-type.liveactivity` を追加したもの

**Live Activity イベントタイプ:**
- `start`: Live Activity を開始（attributes と attributesType が必要）
- `update`: Live Activity を更新
- `end`: Live Activity を終了（dismissalDate でいつ削除するかを指定可能）

**Response:**
```json
{
  "successCount": 1,
  "failureCount": 0,
  "results": [
    {
      "success": true,
      "apnsId": null,
      "deviceToken": "live_activity_push_token_here",
      "error": null
    }
  ]
}
```

## 開発

### 前提条件

- Swift 6.0.3 以降
- mise（バージョン管理）

### セットアップ

```bash
# mise で Swift をインストール
mise install swift@6.0.3

# 依存関係を解決
cd bff/apns-internal-api
swift package resolve
```

### 開発サーバーの起動

```bash
# 環境変数を設定
export X_API_KEY="your_api_key"
export APNS_KEY_ID="your_key_id"
export APNS_TEAM_ID="your_team_id"
export APNS_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----"
export APNS_ENVIRONMENT="sandbox"
export LOG_LEVEL="debug"

# サーバーを起動
swift run
```

### ビルド

```bash
# リリースビルド
swift build -c release
```

### テスト

```bash
# テストを実行
swift test
```

## Docker

### ビルド

```bash
cd bff/apns-internal-api
docker build -t apns-internal-api .
```

### 実行

```bash
docker run -p 8080:8080 \
  -e X_API_KEY="your_api_key" \
  -e APNS_KEY_ID="your_key_id" \
  -e APNS_TEAM_ID="your_team_id" \
  -e APNS_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----" \
  -e APNS_ENVIRONMENT="sandbox" \
  apns-internal-api
```

## プロジェクト構成

```
bff/apns-internal-api/
├── Package.swift                      # パッケージ定義
├── Sources/
│   ├── App/
│   │   ├── Controllers/
│   │   │   └── APNsController.swift   # APNs エンドポイント実装
│   │   ├── Models/
│   │   │   ├── PushNotificationRequest.swift    # プッシュ通知リクエスト型
│   │   │   ├── LiveActivityRequest.swift        # Live Activity リクエスト型
│   │   │   └── APNsResponse.swift              # レスポンス型
│   │   ├── Middleware/
│   │   │   └── AuthMiddleware.swift   # 認証ミドルウェア
│   │   ├── configure.swift            # アプリケーション設定
│   │   └── routes.swift               # ルーティング
│   └── Run/
│       └── main.swift                 # エントリーポイント
├── Tests/
│   └── AppTests/                      # テストコード
├── Dockerfile                         # Docker イメージ定義
└── README.md
```

## セキュリティ

- すべてのリクエストは `Proxy-Authorization` ヘッダーで認証されます
- API キーは環境変数 `X_API_KEY` と一致する必要があります
- APNs 認証情報は適切に保護してください
- 本番環境では HTTPS を使用してください

## APNs 認証キーの取得

1. [Apple Developer Portal](https://developer.apple.com/account/resources/authkeys/list) にアクセス
2. 新しいキーを作成し、APNs を有効化
3. キー ID と .p8 ファイルをダウンロード
4. .p8 ファイルの内容を `APNS_PRIVATE_KEY` 環境変数に設定

## ログ

アプリケーションは構造化ログを出力します：

```
2025-10-10T00:00:00+0000 info: Configuring APNs Internal API
2025-10-10T00:00:00+0000 info: Server will listen on port 8080
2025-10-10T00:00:00+0000 info: Configuring APNs [environment: sandbox, keyId: ABC123, teamId: DEF456]
2025-10-10T00:00:00+0000 info: APNs client configured successfully
2025-10-10T00:00:00+0000 info: Sending batch push notifications [count: 5, validateOnly: false]
2025-10-10T00:00:00+0000 info: Push notification sent successfully [deviceToken: abc123...]
```

## トラブルシューティング

### APNs 接続エラー

- `APNS_PRIVATE_KEY` が正しい PEM 形式であることを確認
- `APNS_KEY_ID` と `APNS_TEAM_ID` が正しいことを確認
- `APNS_ENVIRONMENT` が正しい環境（`sandbox` または `production`）であることを確認

### デバイストークンエラー

- デバイストークンが有効であることを確認
- トピック（バンドル ID）が正しいことを確認
- Live Activity の場合、トピックに `.push-type.liveactivity` サフィックスが必要

## 参考資料

- [Vapor Documentation](https://docs.vapor.codes/)
- [APNSwift Documentation](https://github.com/vapor/apns)
- [Apple Push Notification Service](https://developer.apple.com/documentation/usernotifications)
- [Live Activities](https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities)
