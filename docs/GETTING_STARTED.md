# Getting Started

このドキュメントでは、FlutterKaigi 2025プロジェクト全体の開発環境セットアップとワークフローを説明します。

## 前提条件

開発を始める前に、以下のツールがインストールされていることを確認してください。

### 必須ツール

- **mise** - ツールバージョン管理
  ```bash
  curl https://mise.run | sh
  ```

## セットアップ手順

### 1. リポジトリのクローン

```bash
git clone https://github.com/FlutterKaigi/2025.git
cd 2025
```

### 2. 開発環境の初期化

プロジェクトはmelosを使用したモノレポ構造になっています。以下のコマンドで全ての依存関係をインストールします。

```bash
# ツールのインストール
mise install

# Flutter設定（初回のみ）
flutter config --enable-swift-package-manager

# プロジェクトのブートストラップ
mise run bootstrap
```

## 各アプリケーションの詳細

### カンファレンスアプリケーション

カンファレンスアプリケーションの詳細な環境設定については、[apps/dashboard/README.md](../apps/dashboard/README.md) を参照してください。

### Websiteアプリケーション

ウェブサイトアプリケーションの詳細な環境設定については、[apps/website/README.md](../apps/website/README.md) を参照してください。

## プロジェクト構造

このプロジェクトはmelosを使用したモノレポ構造になっています。

```
/
├── apps/
│   ├── dashboard/            # カンファレンスアプリケーション
│   └── website/              # ウェブサイトアプリケーション
├── packages/                 # 共有パッケージ
│   ├── auth_client/          # 認証クライアント
│   ├── bff_client/           # BFF APIクライアント
│   ├── db_types/             # データベース型定義
│   └── flutterkaigi_lints/   # カスタムリントルール
├── bff/                      # Backend for Frontend
│   ├── bridge/               # BFF Bridge
│   └── engine/               # BFF Engine
├── tools/                    # 開発ツールとスクリプト
├── docs/                     # ドキュメント
├── pubspec.yaml              # ルートパッケージ設定（melos:セクションを含む）
├── mise.toml                 # ツールバージョン管理
├── biome.jsonc               # JavaScript/TypeScript フォーマッター・リンター設定
├── dprint.jsonc              # コードフォーマッター設定
└── cspell.jsonc              # スペルチェッカー設定
```

各アプリケーションの詳細な構造については、それぞれのREADMEを参照してください。

## 開発ガイドライン

### 開発ツール

このプロジェクトでは以下のツールを使用しています。

- **Biome** - JavaScript/TypeScriptのフォーマッターとリンター
- **dprint** - 汎用コードフォーマッター
- **cspell** - スペルチェッカー
- **flutterkaigi_lints** - Dart/Flutter用カスタムリントルール

### コーディング規約

- Dart/Flutterの公式スタイルガイドに従う
- JavaScript/TypeScriptコードはBiomeでフォーマット
- コミット前に以下のコマンドでコード品質を確認。

```bash
# 全プロジェクトの修正
melos run fix

# 全プロジェクトのフォーマット
melos run format

# 全プロジェクトのフォーマットチェック
melos run format:check

# カンファレンスアプリケーションのみの解析
cd apps/dashboard && flutter analyze
```

### コード生成

このプロジェクトではコード生成を使用しています。

```bash
# 全プロジェクトのコード生成
melos run gen
```

> **注意**: 新しいモデルクラスやRouterを追加した場合は、必ずコード生成を実行してください。

### ブランチ戦略

ブランチ運用ルールの詳細については、[docs/BRANCH.md](./BRANCH.md) を参照してください。

## 重要なコマンド

### miseタスク

```bash
# プロジェクトのブートストラップ（初期セットアップ）
mise run bootstrap

# プロジェクトのクリーンアップ
mise run clean
```

### melosコマンド

```bash
# 依存関係のインストール
melos bootstrap

# 全プロジェクトのテスト実行
melos run test    # test:dartとtest:flutterを順番に実行

# 全プロジェクトの修正
melos run fix

# 全プロジェクトのフォーマット
melos run format

# コード生成
melos run gen
```

## トラブルシューティング

### よくある問題と解決方法

1. **Swift Package Manager関連のエラー**
   ```bash
   # Swift Package Managerを有効化（初回のみ）
   flutter config --enable-swift-package-manager
   ```

2. **依存関係のエラー**
   ```bash
   # melosのキャッシュをクリア
   melos clean
   melos bootstrap
   ```

3. **Flutter/Dartバージョンエラー**
   ```bash
   # miseでバージョンを確認
   mise list
   # 正しいバージョンをインストール
   mise install
   ```

4. **デバイスが認識されない**
   ```bash
   flutter doctor -v
   ```

各アプリケーション固有のトラブルシューティングについては、それぞれのREADMEを参照してください。

## 関連ドキュメント

### カンファレンスアプリケーション

- [README](../apps/dashboard/README.md) - アプリケーションの詳細なセットアップと開発ガイド
- [アーキテクチャガイド](./dashboard/ARCHITECTURE.md) - アプリケーションの設計と構造
- [画面一覧](./dashboard/SCREENS.md) - 各画面の仕様と実装詳細

### Websiteアプリケーション

- [Website README](../apps/website/README.md) - ウェブサイトアプリの詳細なセットアップと開発ガイド
