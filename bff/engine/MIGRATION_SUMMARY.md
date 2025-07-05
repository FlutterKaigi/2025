# dart_frog から shelf への移行完了

## 概要

このプロジェクトは、dart_frog フレームワークから shelf/shelf_router フレームワークへの移行が完了しました。既存の機能を維持しながら、より標準的なDartエコシステムに移行しています。

## 変更内容

### 依存関係の変更

- ❌ 削除: `dart_frog: ^1.2.0`
- ✅ 追加: `shelf: ^1.4.0`
- ✅ 追加: `shelf_router: ^1.1.4`
- ✅ 追加: `shelf_router_generator: ^1.0.0` (dev_dependencies)

### ファイル変更

#### 削除されたファイル
- `routes/_middleware.dart`
- `routes/health.dart`
- `routes/v1/users/me.dart`
- `routes/` ディレクトリ全体
- `lib/util/fetch_http_client.dart` (使用されていないWebAssembly用ファイル)

#### 変更されたファイル

**main.dart**
- dart_frog の `Handler` から shelf の `Router` と `Pipeline` に変更
- Riverpod providers の統合
- 全ルートを統一されたファイルに集約

**lib/provider/supabase_util.dart**
- dart_frog の `Request` から shelf の `Request` に変更

**lib/util/exception_handler.dart**
- dart_frog の `Response.json()` から shelf の `Response()` + `jsonEncode()` に変更

**テストファイル**
- dart_frog の `RequestContext` から shelf の `Request` に変更
- Mock objects の適切な更新

## 機能

移行後も以下の機能が維持されています：

### エンドポイント
- `GET /health` - ヘルスチェック
- `GET /v1/users/me` - ユーザー情報取得

### ミドルウェア
- Riverpod provider injection
- SupabaseUtil injection

### エラーハンドリング
- 認証エラー (401)
- データベースエラー (500)
- 一般的な例外ハンドリング

## 技術スタック

- **Web フレームワーク**: shelf + shelf_router
- **依存性注入**: Riverpod
- **データベース**: Supabase
- **テスト**: test + mocktail

## 動作確認

✅ コンパイル成功: `dart compile exe main.dart`
✅ サーバー起動成功: ポート8080でリスニング
✅ 静的解析: 主要なエラーなし

## 今後の改善点

1. riverpod_generator を使用したコード生成の活用
2. shelf_router_generator を使用したルート自動生成
3. テストカバレッジの向上
4. API ドキュメントの自動生成

## 注意事項

- Riverpod は開発版 (3.0.0-dev.15) を使用
- 環境変数 `SUPABASE_URL` と `SUPABASE_SERVICE_ROLE_KEY` が必要
- ポート番号は環境変数 `PORT` で設定可能（デフォルト: 8080）
