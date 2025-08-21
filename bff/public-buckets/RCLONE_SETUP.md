# Rclone で Cloudflare R2 を設定する手順

## 概要

このドキュメントでは、Rclone を使って Cloudflare R2 に接続するための設定手順を説明します。

## 前提条件

- Rclone がインストール済み（ `mise` で管理）
- Cloudflare R2 のアカウント情報

## 必要な情報

Cloudflare R2 から以下の情報を取得してください：

1. **Account ID**
2. **Access Key ID**
3. **Secret Access Key**
4. **Endpoint**

## 設定手順

`~/.config/rclone/rclone.conf` ファイルに以下を追加：

```ini
[r2]
type = s3
provider = Cloudflare
access_key_id = YOUR_ACCESS_KEY_ID
secret_access_key = YOUR_SECRET_ACCESS_KEY
region = auto
endpoint = https://YOUR_ACCOUNT_ID.r2.cloudflarestorage.com
acl = private
```

## 設定の確認

```bash
# リモート一覧を表示
rclone listremotes

# 特定のバケットの内容を表示
rclone ls r2:2025-public-staging
```

## セキュリティ注意事項

- 設定ファイルの権限を適切に設定（600推奨）
- 環境変数での認証情報管理を検討
- 定期的なキーのローテーション

## 参考リンク

- [Rclone 公式ドキュメント](https://rclone.org/)
- [Cloudflare R2 API](https://developers.cloudflare.com/r2/api/)
- [Rclone S3 互換設定](https://rclone.org/s3/#cloudflare-r2)
