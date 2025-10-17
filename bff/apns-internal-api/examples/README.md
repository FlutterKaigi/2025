# APNs Internal API サンプル

このディレクトリには、APNs Internal API を使用するためのサンプルファイルとテストスクリプトが含まれています。

## ファイル一覧

- `test-api.sh`: API のエンドポイントをテストするシェルスクリプト
- `push-notification-request.json`: プッシュ通知のリクエストサンプル
- `live-activity-start-request.json`: Live Activity 開始のリクエストサンプル
- `live-activity-update-request.json`: Live Activity 更新のリクエストサンプル
- `live-activity-end-request.json`: Live Activity 終了のリクエストサンプル

## 使用方法

### テストスクリプトの実行

```bash
# 実行権限を付与
chmod +x examples/test-api.sh

# スクリプトを実行（デフォルト: http://localhost:8080）
export X_API_KEY="your_api_key"
./examples/test-api.sh

# カスタム URL を指定
export API_BASE_URL="https://your-api.example.com"
export X_API_KEY="your_api_key"
./examples/test-api.sh
```

### curl を使用した個別のテスト

#### 1. ヘルスチェック

```bash
curl http://localhost:8080/health
```

#### 2. OpenAPI 仕様書の取得

```bash
curl http://localhost:8080/openapi.json | jq .
```

#### 3. プッシュ通知の送信

```bash
curl -X POST http://localhost:8080/apns/push/batch \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: your_api_key" \
  -d @examples/push-notification-request.json
```

#### 4. Live Activity の開始

```bash
curl -X POST http://localhost:8080/apns/live-activity/batch \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: your_api_key" \
  -d @examples/live-activity-start-request.json
```

#### 5. Live Activity の更新

```bash
curl -X POST http://localhost:8080/apns/live-activity/batch \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: your_api_key" \
  -d @examples/live-activity-update-request.json
```

#### 6. Live Activity の終了

```bash
curl -X POST http://localhost:8080/apns/live-activity/batch \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: your_api_key" \
  -d @examples/live-activity-end-request.json
```

## 注意事項

- サンプルファイル内の `your_device_token_here` や `your_live_activity_push_token_here` を実際のデバイストークンに置き換えてください
- `topic` フィールドは、実際のアプリのバンドル ID に置き換えてください
- Live Activity の場合、topic には `.push-type.liveactivity` サフィックスが必要です
- `validateOnly: true` を設定すると、実際の送信は行わずにリクエストの検証のみを実行します

## OpenAPI 仕様書の活用

取得した OpenAPI 仕様書は、以下のツールで活用できます：

### Swagger Editor で閲覧

1. [Swagger Editor](https://editor.swagger.io/) にアクセス
2. 左側のペインに OpenAPI 仕様書の内容を貼り付け
3. 右側のペインで API ドキュメントを確認

### Postman にインポート

1. Postman を開く
2. Import → Link タブ
3. `http://localhost:8080/openapi.json` を入力
4. API コレクションが自動生成されます

### コード生成

```bash
# Dart クライアントを生成
npx @openapitools/openapi-generator-cli generate \
  -i http://localhost:8080/openapi.json \
  -g dart \
  -o ./generated-dart-client

# TypeScript クライアントを生成
npx @openapitools/openapi-generator-cli generate \
  -i http://localhost:8080/openapi.json \
  -g typescript-axios \
  -o ./generated-ts-client
```

## トラブルシューティング

### 401 Unauthorized エラー

- `Proxy-Authorization` ヘッダーに正しい API キーが設定されているか確認してください
- 環境変数 `X_API_KEY` が正しく設定されているか確認してください

### APNs エラー

- デバイストークンが有効であることを確認してください
- APNs 環境（sandbox / production）が正しいか確認してください
- トピック（バンドル ID）が正しいか確認してください
