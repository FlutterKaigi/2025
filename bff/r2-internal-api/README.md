# R2 Internal API

Cloudflare R2を操作するための内部API

## 機能

- 署名付きURLの生成
- オブジェクトの削除

## エンドポイント

- `PUT /internal/r2/signed-url` - 署名付きURLを作成
- `DELETE /internal/r2/object` - オブジェクトを削除

## 開発

```bash
npm run dev
```

## デプロイ

```bash
# Staging
npm run deploy:staging

# Production  
npm run deploy:production
```