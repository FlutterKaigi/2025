# FlutterKaigi 2025 LXD Staging 環境

このディレクトリには、FlutterKaigi 2025 の FCM Internal API を LXD コンテナにデプロイするための Terraform 設定が含まれています。

## アーキテクチャ

1. **Docker イメージのビルドとプッシュ**
   - Terraform により `bff/fcm-internal-api` のコードから Docker イメージをビルド
   - GitHub Container Registry または Docker Hub にプッシュ

2. **LXD コンテナのデプロイ**
   - Ubuntu 24.04 ベースの LXD コンテナを作成
   - Docker と Docker Compose をインストール
   - レジストリから Docker イメージを pull して実行

## 前提条件

1. **LXD サーバー**
   - LXD がインストール・設定済みであること
   - ネットワーク経由でアクセス可能であること（例: `10.1.1.6`）
   - 認証トークンを持っていること

2. **Docker Registry**
   - GitHub Container Registry (ghcr.io) または Docker Hub のアカウント
   - Personal Access Token (GitHub) または Access Token (Docker Hub)

3. **Firebase**
   - Firebase プロジェクトのサービスアカウント JSON

4. **Terraform**
   - Terraform v1.5 以上がインストールされていること

## セットアップ手順

### 1. 設定ファイルの作成

```bash
cd terraform/lxd/environments/staging

# terraform.tfvars を作成
cp terraform.tfvars.example terraform.tfvars

# backend.tfbackend を作成
cp backend.tfbackend.example backend.tfbackend
```

### 2. terraform.tfvars の編集

```hcl
# LXD Configuration
LXD_TOKEN = "your-lxd-token"

# Docker Registry Configuration (GitHub Container Registry を使用する場合)
DOCKER_REGISTRY_ADDRESS  = "ghcr.io/flutterkaigi"
DOCKER_REGISTRY_USERNAME = "your-github-username"
DOCKER_REGISTRY_PASSWORD = "ghp_your_github_personal_access_token"

# Firebase Configuration
FIREBASE_SERVICE_ACCOUNT_JSON_STAGING = "{ ... }"
```

#### GitHub Container Registry の Personal Access Token の作成方法

1. GitHub の [Settings > Developer settings > Personal access tokens > Tokens (classic)](https://github.com/settings/tokens) にアクセス
2. "Generate new token (classic)" をクリック
3. 以下のスコープを選択：
   - `write:packages` - パッケージのアップロード
   - `read:packages` - パッケージのダウンロード
   - `delete:packages` - パッケージの削除（オプション）
4. トークンを生成してコピー

### 3. backend.tfbackend の編集

```hcl
bucket = "your-terraform-state-bucket"
key    = "terraform/lxd/staging/terraform.tfstate"
region = "ap-northeast-1"
```

### 4. Terraform の初期化

```bash
terraform init -backend-config=backend.tfbackend
```

### 5. プランの確認

```bash
terraform plan
```

作成されるリソース：

- Docker イメージ（fcm-internal-api）
- LXD コンテナ（flutterkaigi-2025-fcm-internal-api-stg）

### 6. 適用

```bash
terraform apply
```

## デプロイ後の確認

### コンテナの IP アドレスを確認

```bash
terraform output fcm_internal_api_ipv4
```

### API の動作確認

```bash
# ヘルスチェック
curl http://<container-ip>:8080/health

# レスポンス例
{"status":"ok","timestamp":"2025-10-23T19:00:00.000Z"}
```

### コンテナへのアクセス

```bash
# LXD コンテナにアクセス
lxc exec flutterkaigi-2025-fcm-internal-api-stg -- bash

# fcm-api ユーザーとしてアクセス
lxc exec flutterkaigi-2025-fcm-internal-api-stg -- su - fcm-api
```

### サービスの状態確認

```bash
# コンテナ内で実行
cd /opt/fcm-internal-api
docker compose ps
docker compose logs -f
```

## トラブルシューティング

### Docker イメージのビルドに失敗する

```bash
# ローカルでビルドテスト
cd ../../bff/fcm-internal-api
docker build -t test-fcm-api .
```

### コンテナが起動しない

```bash
# LXD コンテナのログを確認
lxc info flutterkaigi-2025-fcm-internal-api-stg --show-log

# cloud-init のステータスを確認
lxc exec flutterkaigi-2025-fcm-internal-api-stg -- cloud-init status
```

### Docker イメージが pull できない

```bash
# コンテナ内で Docker 認証を確認
lxc exec flutterkaigi-2025-fcm-internal-api-stg -- cat /root/.docker/config.json

# 手動で pull してみる
lxc exec flutterkaigi-2025-fcm-internal-api-stg -- docker pull <image-name>
```

## クリーンアップ

```bash
# リソースを削除
terraform destroy

# 確認後、yes を入力
```

## 参考リンク

- [LXD Documentation](https://documentation.ubuntu.com/lxd/)
- [Terraform Docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)


