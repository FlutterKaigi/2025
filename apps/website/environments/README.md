# Environment Configuration

このディレクトリには、FlutterKaigi 2025 Websiteの環境別設定ファイルが含まれています。

## 環境ファイル

- `.env.dev` - 開発環境（ローカルBFF: http://localhost:8080/v1）
- `.env.stg` - ステージング環境（Cloudflare Workers Staging）
- `.env.prod` - 本番環境（本番BFF: https://2025-bff.flutterkaigi.jp/v1）

## 使用方法

### 開発サーバー起動

```bash
# 本番環境のBFF APIを使用（デフォルト）
make dev

# 開発環境のBFF APIを使用（ローカルBFF必須）
make dev-dev

# ステージング環境のBFF APIを使用
make dev-stg

# 本番環境のBFF APIを使用（明示的）
make dev-prod
```

### ビルド

```bash
# 本番環境のBFF APIを使用してビルド（デフォルト）
make build

# 開発環境のBFF APIを使用してビルド
make build-dev

# ステージング環境のBFF APIを使用してビルド
make build-stg

# 本番環境のBFF APIを使用してビルド（明示的）
make build-prod
```

### セッション情報のみ取得

```bash
# 環境ファイルを使用
export $(cat environments/.env.dev | xargs) && make fetch-sessions

# または直接環境変数を指定
BFF_BASE_URL=http://localhost:8080/v1 make fetch-sessions
```

## 環境変数

### BFF_BASE_URL

BFF APIのベースURL。セッション情報の取得に使用されます。

- **dev**: `http://localhost:8080/v1`
- **stg**: `https://flutterkaigi-2025-bff-staging.flutterkaigi.workers.dev/v1`
- **prod**: `https://2025-bff.flutterkaigi.jp/v1`

## 注意事項

- `make dev-dev`を使用する場合は、ローカルでBFFサーバーが起動している必要があります
- 環境ファイルはGitにコミットされます（シークレット情報は含まれていません）
- ビルド時にBFF APIからセッション情報を取得するため、ネットワーク接続が必要です
