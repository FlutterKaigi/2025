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

1. ローカル開発環境を起動する

```bash
bun run supabase start
```

これにより、ローカルのPostgreSQLデータベースとSupabaseの各種サービスが起動します。

### スキーマ管理方法

このプロジェクトでは宣言的なスキーマ管理を採用しています。スキーマは`supabase/schemas`ディレクトリに定義され、マイグレーションは`supabase/migrations`ディレクトリに生成されます。

#### 既存のスキーマを更新する場合

1. ローカル環境を停止する

   ```bash
   bun run supabase stop
   ```

1. スキーマファイルを編集する

1. マイグレーションファイルを生成する

   ```bash
   bun run supabase db diff -f update_schema
   ```

1. 生成されたマイグレーションファイルを確認する

1. ローカル環境を起動し、マイグレーションを適用する

   ```bash
   bun run supabase start && bun run supabase migration up
   ```
