# SakuraCloud Terraform

このディレクトリには、SakuraCloud AppRunを使用してFlutterKaigi 2025のバックエンドサービスをデプロイするためのTerraform設定が含まれています。

## アーキテクチャ

### デプロイされるサービス

1. **BFF (Backend for Frontend)** - メインのバックエンドAPI
   - モジュール: `modules/apprun`
   - リポジトリ: `bff/engine`

2. **FCM Internal API** - プッシュ通知管理API
   - モジュール: `modules/apprun_fcm`
   - リポジトリ: `bff/fcm-internal-api`

### モジュール構成

- `modules/container_registry/` - SakuraCloudコンテナレジストリの管理
- `modules/docker/` - Dockerイメージのビルドとプッシュ
- `modules/apprun/` - BFF用のAppRun設定
- `modules/apprun_fcm/` - FCM Internal API用のAppRun設定
- `modules/random/` - ランダムパスワード生成

## 環境

### Staging

- ディレクトリ: `environments/staging/`
- BFF URL: AppRunによって自動生成
- FCM Internal API URL: AppRunによって自動生成

### Production

- ディレクトリ: `environments/production/`
- BFF URL: AppRunによって自動生成
- FCM Internal API URL: AppRunによって自動生成

## 参考リンク

- [SakuraCloud Terraform Provider](https://registry.terraform.io/providers/sacloud/sakuracloud/latest)
- [SakuraCloud AppRun ドキュメント](https://manual.sakura.ad.jp/cloud/appliance/apprun/)
- [Docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest)
