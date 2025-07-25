# Supabase

## セットアップ手段

### 前提条件

- [mise](https://mise.jdx.dev/) がインストールされていること
- Dockerがインストールされていること
  - macOS環境では、[OrbStack](https://orbstack.dev/) を使用することを推奨します

### ローカル開発環境のセットアップ

基本的に、親ディレクトリである`2025`ディレクトリでコマンドを実行してください

1. miseで依存関係をインストールする

```bash
mise install
```

1. bunの依存関係を解決する

```bash
bun install
```

1. .env を設定する

以下のように `.env.example` をコピーして `.env` を作成します。

```shell
cp .env.example .env
```

その後、開発チームリーダーから必要な値を共有してもらい、開発環境であれば以下のように設定する。

```env
APP_REDIRECT_URL=jp.flutterkaigi.2025.dashboard.dev://login-callback
SUPABASE_AUTH_EXTERNAL_GOOGLE_CLIENT_ID=xxx
SUPABASE_AUTH_EXTERNAL_GOOGLE_CLIENT_SECRET=xxx
```

1. ローカル開発環境を起動する

```bash
bunx supabase start
```

これにより、ローカルのPostgreSQLデータベースとSupabaseの各種サービスが起動します。

### スキーマ管理方法

スキーマの管理方法については、[supabase/migrations/README.md](migrations/README.md)を参照してください

## CI/CD

- `supabase`ディレクトリへの変更を含むPRを作成すると、自動的にLint, ApplyのDry Runが行われます
  - この際、PRのコメントには、Dry Runのログが表示されます
  - mainブランチにマージされると、Production, Stagingのデータベースに適用されます
