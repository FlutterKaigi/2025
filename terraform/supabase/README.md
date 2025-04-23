# FlutterKaigi 2025 Supabase Terraform

このディレクトリには、FlutterKaigi 2025プロジェクトで使用するSupabase環境をTerraformで管理するためのコードが含まれています。

## 概要

このTerraformコードは、Supabaseプロジェクトを以下の環境で管理します：

- **Production環境**: `flutterkaigi-2025-production`
- **Staging環境**: `flutterkaigi-2025-staging`

両環境とも東京リージョン（ap-northeast-1）にデプロイされます。

## ファイル構成

- `production.tf`: 本番環境のSupabaseプロジェクト設定
- `staging.tf`: ステージング環境のSupabaseプロジェクト設定
- `provider.tf`: Supabase Terraformプロバイダーの設定
- `variables.tf`: 変数定義ファイル
- `backend.tf`: Terraform Stateを保存するバケットの設定
- (gitignore) `backend.tfbackend`: Cloudflare R2へのアクセスキーを格納
  - `backend.tfbackend.example`をコピーし、Access KeyとSecret Keyを設定してください
