# Nameplate Exporter

チケット購入者のネームプレートデータをCSVでエクスポートし、プロフィール画像を取得するツールです。

## 機能

- normalを除くチケット購入者の情報をCSVでエクスポート
- プロフィール画像の取得：
  - `profiles.avatar_key` がある場合：`data/2025-production/{key}` を `output/{user_id}` にコピー
  - なければ `auth.users.raw_user_metadata.avatar_url` からダウンロード
  - なければスキップ
- エラー発生時は `error.log` に記録し、CSVのAvatar列は空にする

## 使い方

```sh
bun install
```

実行:

```sh
bun run dev
```

出力:

- `nameplate_data.csv` - チケット購入者の情報（Avatar列にファイル名が含まれる）
- `output/` - プロフィール画像（{user_id}.jpg など）
- `error.log` - エラーログ（エラーが発生した場合のみ）
