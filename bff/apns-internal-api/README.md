# APNs Internal API

FlutterKaigi 2025 の APNs（Apple Push Notification service）通知配信を行うための内部 API です。

## 概要

この API は、Vapor と APNSwift を使用して、APNs 経由でプッシュ通知と Live Activity の更新をバッチ送信するための内部サービスです。

## クイックスタート

```bash
# 1. プロジェクトルートで Swift をインストール
cd /path/to/FlutterKaigi/2025
mise install

# 2. apns-internal-api ディレクトリに移動
cd bff/apns-internal-api

# 3. 環境変数を設定
cp env.sample .env
# .env ファイルを編集して実際の値を設定

# 4. サーバーを起動
./start-server.sh

# 5. 別のターミナルで動作確認
curl http://localhost:8080/health
curl http://localhost:8080/openapi.json | jq .
```

詳細な手順は「[ローカル環境での実行方法](#ローカル環境での実行方法)」セクションを参照してください。

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

> 📝 **サンプルとテストスクリプトは [examples/](./examples/) ディレクトリを参照してください**

### GET /openapi.json

OpenAPI 仕様書を取得します（認証不要）

このエンドポイントで OpenAPI 3.0 形式の API 仕様を取得できます。Swagger UI や Stoplight などのツールで利用できます。

**Response:**

```json
{
  "openapi": "3.0.1",
  "info": {
    "title": "APNs Internal API",
    "description": "...",
    "version": "1.0.0"
  },
  ...
}
```

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

#### Live Activity を開始する場合 (start イベント)

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

#### Live Activity を更新する場合 (update イベント)

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

#### Live Activity を終了する場合 (end イベント)

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

## ローカル環境での実行方法

### ステップ1: 前提条件の確認

以下がインストールされていることを確認してください：

- **mise**: プロジェクトのルートディレクトリで使用しているバージョン管理ツール
- **Swift 6.0.3 以降**: mise経由でインストール可能

### ステップ2: Swift のインストール

プロジェクトのルートディレクトリで mise を使用して Swift をインストールします：

```bash
# プロジェクトルートに移動
cd /path/to/FlutterKaigi/2025

# mise で全ての依存関係をインストール（Swift を含む）
mise install

# Swift のバージョンを確認
swift --version
```

### ステップ3: 依存関係の解決

```bash
# apns-internal-api ディレクトリに移動
cd bff/apns-internal-api

# Swift パッケージの依存関係を解決
swift package resolve

# ビルドが通ることを確認（オプション）
swift build
```

### ステップ4: 環境変数の設定

APNs の認証情報を設定します。以下の2つの方法があります：

#### 方法A: 環境変数ファイルを使用（推奨）

サンプルファイルをコピーして `.env` ファイルを作成：

```bash
# サンプルファイルをコピー
cp env.sample .env

# .env ファイルを編集して実際の値を設定
vim .env  # または好みのエディタで編集

# 環境変数を読み込み
source .env
```

`.env` ファイルの内容例：

```bash
export X_API_KEY="your_test_api_key_here"
export APNS_KEY_ID="your_apns_key_id"
export APNS_TEAM_ID="your_apple_team_id"
export APNS_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----
your private key content here
-----END PRIVATE KEY-----"
export APNS_ENVIRONMENT="sandbox"
export LOG_LEVEL="debug"
export PORT="8080"
```

#### 方法B: 直接エクスポート

```bash
export X_API_KEY="your_test_api_key_here"
export APNS_KEY_ID="your_apns_key_id"
export APNS_TEAM_ID="your_apple_team_id"
export APNS_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----
your private key content here
-----END PRIVATE KEY-----"
export APNS_ENVIRONMENT="sandbox"
export LOG_LEVEL="debug"
export PORT="8080"
```

**APNs 認証情報の取得方法:**

1. [Apple Developer Portal](https://developer.apple.com/account/resources/authkeys/list) にアクセス
2. 新しいキーを作成し、APNs を有効化
3. キー ID（10文字）と .p8 ファイルをダウンロード
4. Team ID は Apple Developer の Membership ページで確認
5. .p8 ファイルの内容を `APNS_PRIVATE_KEY` に設定

### ステップ5: サーバーの起動

#### 簡単な方法: 起動スクリプトを使用

```bash
# .env ファイルが設定されていれば、このスクリプト一つで起動できます
./start-server.sh
```

起動スクリプトは以下を自動的に行います：

- `.env` ファイルの読み込み
- 必須環境変数のチェック
- Swift のインストール確認
- 依存関係の解決
- サーバーの起動

#### 手動での起動

```bash
# 環境変数を読み込み
source .env

# 開発モードで起動
swift run

# または、リリースモードでビルドして起動（高速）
swift build -c release
.build/release/Run
```

サーバーが起動すると、以下のようなログが表示されます：

```
[ INFO ] Configuring APNs Internal API
[ INFO ] Server will listen on port 8080
[ INFO ] Configuring APNs [environment: sandbox, keyId: ABC123DEFG, teamId: XYZ789]
[ INFO ] APNs client configured successfully
[ NOTICE ] Server starting on http://127.0.0.1:8080
```

### ステップ6: 動作確認

別のターミナルを開いて以下のコマンドで動作を確認：

```bash
# ヘルスチェック
curl http://localhost:8080/health

# OpenAPI 仕様書を確認
curl http://localhost:8080/openapi.json | jq .

# テストスクリプトを実行
cd bff/apns-internal-api
export X_API_KEY="your_test_api_key_here"
./examples/test-api.sh
```

### トラブルシューティング

#### Swift が見つからない

```bash
# プロジェクトルートで mise install を実行
cd /path/to/FlutterKaigi/2025
mise install

# mise でインストールされた Swift のパスを確認
mise which swift
```

#### 依存関係の解決に失敗する

```bash
# キャッシュをクリア
rm -rf .build
swift package clean
swift package resolve
```

#### ポート 8080 が既に使用されている

```bash
# 別のポートを指定
export PORT="8081"
swift run
```

#### APNs 認証エラー

- `APNS_PRIVATE_KEY` が正しい PEM 形式であることを確認
- 改行が `\n` ではなく実際の改行になっているか確認
- .p8 ファイルの内容をそのままコピーしているか確認

## 開発

### 前提条件

- Swift 6.0.3 以降
- mise（バージョン管理）

### ホットリロード

開発中は、ファイルを変更するたびに手動でサーバーを再起動する必要があります：

1. サーバーを停止（Ctrl+C）
2. `swift run` で再起動

### デバッグログの有効化

```bash
export LOG_LEVEL="debug"
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
│   │   └── routes.swift               # ルーティング（OpenAPI 定義を含む）
│   └── Run/
│       └── main.swift                 # エントリーポイント
├── Tests/
│   └── AppTests/                      # テストコード
├── examples/                          # サンプルとテストスクリプト
│   ├── README.md                      # サンプルの使い方
│   ├── test-api.sh                    # API テストスクリプト
│   ├── push-notification-request.json
│   ├── live-activity-start-request.json
│   ├── live-activity-update-request.json
│   └── live-activity-end-request.json
├── env.sample                         # 環境変数のサンプルファイル
├── start-server.sh                    # サーバー起動スクリプト
├── Dockerfile                         # Docker イメージ定義
├── LIVE_ACTIVITY_SPEC.md              # Live Activity 仕様書
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

## OpenAPI 仕様書の利用

このAPIは、OpenAPI 3.0形式のAPI仕様書を提供しています。

### 仕様書の取得

```bash
curl http://localhost:8080/openapi.json
```

### Swagger UI で閲覧

1. [Swagger Editor](https://editor.swagger.io/) にアクセス
2. 取得した `openapi.json` の内容を貼り付け
3. API の仕様を視覚的に確認できます

### Stoplight で閲覧

Stoplight を使用して、よりリッチなドキュメントを表示できます：

```bash
# Node.js がインストールされている場合
npx @stoplight/elements-dev-portal openapi.json
```

### コード生成

OpenAPI 仕様書から、各言語のクライアントコードを生成できます：

```bash
# OpenAPI Generator を使用
npx @openapitools/openapi-generator-cli generate \
  -i http://localhost:8080/openapi.json \
  -g dart \
  -o ./generated-client
```

サポートされている生成言語：

- Dart
- TypeScript/JavaScript
- Swift
- Kotlin
- Python
- など

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
- [VaporToOpenAPI Documentation](https://github.com/dankinsoid/VaporToOpenAPI)
- [Apple Push Notification Service](https://developer.apple.com/documentation/usernotifications)
- [Live Activities](https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities)
- [OpenAPI Specification](https://swagger.io/specification/)
