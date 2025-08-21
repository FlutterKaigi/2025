# FlutterKaigi 2025 R2 Bucket Management

Cloudflare R2バケットを直接利用した企業ロゴ画像管理システムです。

## 🎯 概要

このシステムは以下の機能を提供します：

- **企業ロゴ画像の一括アップロード**: 自動化されたアップロードスクリプト
- **画像ギャラリー表示**: ステージング環境での画像確認
- **R2バケットへの直接アクセス**: 高速・シンプルなファイル管理
- **環境別のバケット管理**: production/staging環境の分離

## 🏗️ システム構成

```
bff/bucket/
├── companies/                    # 企業ロゴ画像ファイル
├── logs/                        # アップロードログ
│   └── .gitignore              # ログファイルのGit除外設定
├── staging-company-logos-upload.sh    # 一括アップロードスクリプト
├── staging-company-logos-gallery.html # 画像ギャラリー
└── README.md                    # このファイル
```

## 🚀 セットアップ

### 1. 前提条件

```bash
# bunがインストール済み
bun --version

# Cloudflare認証
bunx wrangler login
```

### 2. R2バケットの確認

```bash
# 既存のバケット一覧を確認
bunx wrangler r2 bucket list

# バケットの詳細情報を確認
bunx wrangler r2 bucket info 2025-production
bunx wrangler r2 bucket info 2025-staging
```

### 3. バケット設定の確認

```bash
# ステージング環境のパブリックアクセス状態確認
bunx wrangler r2 bucket dev-url get 2025-staging

# 本番環境のカスタムドメイン設定確認
bunx wrangler r2 bucket domain list 2025-production
```

**注意**: バケットの基本設定は完了済みです。カスタムドメインの設定のみ必要に応じて行ってください。

## 📁 使用方法

### 企業ロゴの一括アップロード

```bash
# 一括アップロード実行（実行権限は既に付与済み）
./staging-company-logos-upload.sh
```

**スクリプトの特徴:**

- ✅ `companies` ディレクトリ配下の全ロゴを自動検出・アップロード
- 📊 リアルタイム進捗表示（パーセンテージ、残り時間）
- 🎨 色付き出力で見やすい表示
- 📝 詳細なログファイル生成
- ⚡ エラーハンドリングと前提条件チェック
- 🔍 サポート形式: WebP, PNG, JPG, JPEG

### 画像ギャラリーの表示

```bash
# HTMLファイルをブラウザで開く
open staging-company-logos-gallery.html
# または
# ブラウザで直接ファイルを開く
```

**ギャラリーの特徴:**

- 🖼️ `companies` ディレクトリ配下の全ロゴを美しく表示
- 📱 レスポンシブデザイン（モバイル対応）
- 📊 統計情報表示（総企業数、読み込み済み、エラー数）
- 🎯 エラーハンドリングと成功メッセージ
- 🔄 動的画像読み込み（R2バケットからリアルタイム取得）

## 🌐 アクセス方法

### 開発環境（ステージング）

画像に直接アクセス：

```
https://pub-{hash}.r2.dev/companies/image.webp
```

**現在のURL例:**

```
https://pub-7d4d3c7b0d86496dbaed4e7c947d123c.r2.dev/companies/04feaac2-4660-4260-b66c-e5d8a071d219.webp
```

### 本番環境

カスタムドメイン経由：

```
https://your-domain.com/companies/image.webp
```

## 📊 パフォーマンス

### アップロード性能

- **処理速度**: 24件の画像を約1分で完了
- **成功率**: 100%（エラーハンドリング完備）
- **並行処理**: シーケンシャル処理で確実性重視

### 表示性能

- **画像サイズ**: 300px高さ（レスポンシブ対応）
- **読み込み**: Lazy loading対応
- **キャッシュ**: 24時間のブラウザキャッシュ

## ⚠️ 注意事項

### セキュリティ

- **ステージング環境**: パブリックアクセス（開発・テスト用）
- **本番環境**: カスタムドメイン + CDN（セキュリティ重視）
- **ログファイル**: Gitから除外（機密情報保護）

### 制限事項

- **ファイルサイズ**: 100MBまで
- **サポート形式**: WebP, PNG, JPG, JPEG
- **バケット数**: 環境別に2つ（production/staging）

## 🔄 更新履歴

- **2025-08-18**: 企業ロゴ一括アップロードスクリプト追加
- **2025-08-18**: 画像ギャラリーページ作成
- **2025-08-18**: ログ管理システム構築

## 📞 サポート

問題が発生した場合：

1. **ログファイルを確認**: `logs/` ディレクトリ内
2. **前提条件を確認**: bunx、wrangler、認証状態
3. **スクリプトの権限確認**: 実行権限が付与されているか

---

**FlutterKaigi 2025** - 企業ロゴ管理システム 🚀
