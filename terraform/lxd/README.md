# FlutterKaigi 2025 LXD モニタリング環境

このディレクトリには、FlutterKaigi 2025のモニタリングスタックをLXDコンテナにデプロイするためのTerraform設定が含まれています。

## 構成

### モニタリングスタック

- **Grafana Alloy**: メトリクス、ログ、トレースの収集（OpenTelemetry互換）
- **Loki**: ログストレージとクエリエンジン
- **Tempo**: 分散トレースストレージとクエリエンジン
- **Grafana**: メトリクス、ログ、トレースの統合可視化ダッシュボード

### セキュアアクセス

- **Cloudflare Tunnel**: インターネットからの安全なアクセス（ポート開放不要）
- **Cloudflare Access**: ゼロトラストアクセス制御

### インフラストラクチャ

- **プラットフォーム**: LXD Container
- **OS**: Ubuntu 24.04
- **コンテナランタイム**: Docker + Docker Compose v2
- **リソース**: CPU 8コア、メモリ 16GB、ディスク 100GB

## 前提条件

1. LXDがインストール・設定済みであること
2. Terraformがインストールされていること（推奨: v1.5+）
3. LXDへのアクセストークンを持っていること
4. Cloudflareアカウントを持っていること
5. Cloudflare Zero Trustが有効になっていること（無料プランで利用可能）
6. 管理対象のドメインがCloudflareに登録されていること

## セットアップ手順

### 1. Cloudflare API トークンの作成

1. [Cloudflare Dashboard](https://dash.cloudflare.com/profile/api-tokens) にアクセス
2. "Create Token" をクリック
3. 以下の権限を持つカスタムトークンを作成：
   - **Account** > **Cloudflare Tunnel** > **Edit**
   - **Account** > **Access: Apps and Policies** > **Edit**
   - **Zone** > **DNS** > **Edit**
4. トークンをコピーして保存

### 2. 必要な情報を収集

以下の情報を確認してください：

- **Account ID**: [Cloudflare Dashboard](https://dash.cloudflare.com/) のアカウントページから確認
- **Zone ID**: 対象ドメインのページから確認
- **Zone**: 管理対象のドメイン名（例: `flutterkaigi.jp`）
- **Email**: アクセス許可するメールアドレス

### 3. 設定ファイルの作成

```bash
cd terraform/lxd/environments/production
cp terraform.tfvars.example terraform.tfvars
```

`terraform.tfvars`を編集して、収集した情報を入力します：

```hcl
LXD_TOKEN              = "your-lxd-token"
CLOUDFLARE_API_TOKEN   = "your-cloudflare-api-token"
CLOUDFLARE_ACCOUNT_ID  = "your-account-id"
CLOUDFLARE_ZONE_ID     = "your-zone-id"
CLOUDFLARE_ZONE        = "flutterkaigi.jp"
CLOUDFLARE_EMAIL       = "your-email@example.com"
```

> ⚠️ **重要**: `terraform.tfvars`は機密情報を含むため、バージョン管理から除外してください！

### 4. Terraform初期化

```bash
terraform init -backend-config=backend.tfbackend
```

### 5. プランの確認

```bash
terraform plan
```

作成されるリソースを確認します：

- LXDコンテナ
- Cloudflare Tunnel
- DNS レコード（monitoring.ZONE, alloy.ZONE）
- Cloudflare Access アプリケーション

### 6. 適用

```bash
terraform apply
```

> 💡 **Tip**: 初回適用には5-10分程度かかる場合があります。

## デプロイ後のアクセス

### Grafana

- URL: `http://<LXD_CONTAINER_IP>:3000`
- ユーザー名: `admin`
- パスワード: `flutterkaigi2025`

> ⚠️ **セキュリティ**: 本番環境では必ずパスワードを変更してください！

### その他のサービス

- **Alloy UI**: `http://<LXD_CONTAINER_IP>:12345`
- **Loki API**: `http://<LXD_CONTAINER_IP>:3100`
- **Tempo API**: `http://<LXD_CONTAINER_IP>:3200`

## OpenTelemetry送信設定

アプリケーションから以下のエンドポイントにテレメトリデータを送信できます：

```yaml
# OTLP gRPC
endpoint: <LXD_CONTAINER_IP>:4317

# OTLP HTTP
endpoint: http://<LXD_CONTAINER_IP>:4318

# Zipkin
endpoint: http://<LXD_CONTAINER_IP>:9411

# Jaeger HTTP
endpoint: http://<LXD_CONTAINER_IP>:14268
```

### Flutter/Dartアプリケーションからの送信例

```dart
// pubspec.yaml
dependencies:
  opentelemetry_api: ^latest
  opentelemetry_sdk: ^latest

// main.dart
import 'package:opentelemetry_api/opentelemetry_api.dart';

final tracer = opentelemetry.getTracer('flutterkaigi-app');

void main() {
  // トレース送信設定
  final exporter = OtlpHttpTraceExporter(
    endpoint: 'http://<LXD_CONTAINER_IP>:4318/v1/traces',
  );

  runApp(MyApp());
}
```

## 運用

### コンテナへのアクセス

```bash
# LXDコンテナにアクセス
lxc exec flutterkaigi-2025-monitoring -- bash

# monitoringユーザーとしてアクセス
lxc exec flutterkaigi-2025-monitoring -- su - monitoring
```

### サービスの状態確認

```bash
# コンテナ内で実行
cd /opt/monitoring
docker compose ps
docker compose logs -f
```

### サービスの再起動

```bash
# コンテナ内で実行
cd /opt/monitoring
docker compose restart

# 特定のサービスのみ再起動
docker compose restart grafana
```

### データの永続化

以下のDockerボリュームにデータが永続化されています：

- `grafana-data`: Grafanaの設定とダッシュボード
- `loki-data`: Lokiのログデータ
- `tempo-data`: Tempoのトレースデータ

### バックアップ

```bash
# コンテナ内で実行
cd /opt/monitoring
docker compose down
tar czf monitoring-backup-$(date +%Y%m%d).tar.gz \
  /var/lib/docker/volumes/monitoring_grafana-data \
  /var/lib/docker/volumes/monitoring_loki-data \
  /var/lib/docker/volumes/monitoring_tempo-data
docker compose up -d
```

## トラブルシューティング

### サービスが起動しない

```bash
# ログを確認
docker compose logs

# 特定のサービスのログ
docker compose logs alloy
docker compose logs loki
docker compose logs tempo
docker compose logs grafana
```

### ポートが競合する

cloud-init.yamlまたはdocker-compose.ymlのポート設定を変更してください。

### メモリ不足

Terraformの`main.tf`でメモリ制限を増やしてください：

```hcl
limits = {
  cpu = 8
  memory = "32GB"  # 16GB → 32GB
}
```

### ディスク容量不足

古いログやトレースを削除するか、ディスクサイズを増やしてください：

```hcl
device {
  name = "root"
  type = "disk"
  properties = {
    path = "/"
    pool = "default"
    size = "200GB"  # 100GB → 200GB
  }
}
```

## 設定ファイルのカスタマイズ

### Alloy設定

`terraform/lxd/modules/lxd/cloud-init.yaml`内の`/opt/monitoring/alloy/config.alloy`セクションを編集します。

### Loki設定

`terraform/lxd/modules/lxd/cloud-init.yaml`内の`/opt/monitoring/loki/config.yaml`セクションを編集します。

### Tempo設定

`terraform/lxd/modules/lxd/cloud-init.yaml`内の`/opt/monitoring/tempo/config.yaml`セクションを編集します。

### Grafanaデータソース

`terraform/lxd/modules/lxd/cloud-init.yaml`内の`/opt/monitoring/grafana/datasources.yaml`セクションを編集します。

## アーキテクチャ図

```
┌─────────────────────────────────────────────────────────────┐
│                    LXD Container (Ubuntu 24.04)             │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │                Docker Compose Stack                   │  │
│  │                                                       │  │
│  │  ┌─────────────┐    ┌──────────┐    ┌───────────┐  │  │
│  │  │   Grafana   │───▶│   Loki   │    │   Tempo   │  │  │
│  │  │   :3000     │    │  :3100   │    │   :3200   │  │  │
│  │  └─────────────┘    └──────────┘    └───────────┘  │  │
│  │         ▲                ▲                 ▲         │  │
│  │         │                │                 │         │  │
│  │         │          ┌─────────────┐         │         │  │
│  │         └──────────│    Alloy    │─────────┘         │  │
│  │                    │   :12345    │                   │  │
│  │                    │   :4317-18  │                   │  │
│  │                    └─────────────┘                   │  │
│  │                           ▲                          │  │
│  └───────────────────────────┼───────────────────────────┘  │
│                              │                              │
└──────────────────────────────┼──────────────────────────────┘
                               │
                               │ OTLP/HTTP/gRPC
                               │
                    ┌──────────┴──────────┐
                    │  Flutter/Dart Apps  │
                    │   Other Services    │
                    └─────────────────────┘
```

## 参考リンク

- [Grafana Alloy Documentation](https://grafana.com/docs/alloy/)
- [Grafana Loki Documentation](https://grafana.com/docs/loki/)
- [Grafana Tempo Documentation](https://grafana.com/docs/tempo/)
- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [LXD Documentation](https://documentation.ubuntu.com/lxd/)

## ライセンス

このプロジェクトは、リポジトリのルートにあるLICENSEファイルに従います。
