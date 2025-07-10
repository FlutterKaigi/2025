# BFF Engine - Dart Frog

Dart Frogで構築されたFlutterKaigi 2025 BFF APIサーバーです。

このプロジェクトは、WebAssembly/Cloudflare WorkersからDart VMへ移行し、dart_frogフレームワークを使用しています。

## 機能

- REST API エンドポイント
- Supabase統合
- ユーザー認証
- ヘルスチェックエンドポイント
- miseによるDockerサポート

## 開発

### 前提条件

- mise（ツール管理用）

### セットアップ

1. 依存関係をインストール

```bash
mise install
dart pub get
```

1. 開発サーバーを起動：

- miseにより、`.env`の中に設定されている値が環境変数に設定され、この値がdartでも利用されます

```bash
dart run lib/main.dart
```

サーバーは <http://localhost:8080> で利用可能です

## Docker

### Docker Composeの使用

- `.env.stg`(Supabase Cloud Staging)の次に`.env.dev`(ローカル環境)が参照されます

```bash
docker compose up -d --remove-orphans --build
```
