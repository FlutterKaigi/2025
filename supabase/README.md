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

スキーマの管理方法については、[supabase/migrations/README.md](migrations/README.md)を参照してください

### 単体テストの記載方法

単体テストの記載については、[supabase/tests/README.md](migrations/README.md)を参照してください
