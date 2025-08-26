# R2 Internal API

Cloudflare R2を操作するHonoベースの内部API

## 概要

このAPIは、Cloudflare R2ストレージを操作するための内部APIです。ファイルのアップロード用署名付きURLの生成とオブジェクトの削除機能を提供します。

## エンドポイント

### PUT /internal/r2/signed-url

ファイルアップロード用の署名付きURLを生成します。

**リクエスト:**
```json
{
  "key": "avatar/user123.jpg",
  "size": 1024000,
  "mimeType": "image/jpeg",
  "variant": "avatar",
  "expiresIn": 3600
}
```

**レスポンス:**
```json
{
  "key": "avatar/user123.jpg",
  "signed_url": "https://..."
}
```

### DELETE /internal/r2/object

R2バケットからオブジェクトを削除します。

**リクエスト:**
```json
{
  "key": "avatar/user123.jpg"
}
```

**レスポンス:**
```json
{
  "success": true,
  "key": "avatar/user123.jpg"
}
```

## 環境変数

`.dev.vars`ファイルに以下の環境変数を設定してください：

```
CLOUDFLARE_R2_ACCESS_KEY_ID=your_access_key_id
CLOUDFLARE_R2_SECRET_ACCESS_KEY=your_secret_access_key
CLOUDFLARE_R2_BUCKET_NAME=flutterkaigi-2025
```

## 開発

```bash
# 開発サーバーの起動
npm run dev

# デプロイ
npm run deploy
```