# DB Client

## 概要

- FlutterKaigi 2025のBFFで利用するデータベースクライアントライブラリです
- Cloudflare WorkersのHyperdrive（PostgreSQL）との接続を提供します
- Dart製のライブラリで、BFFのWebAssembly環境で動作します

## 機能

- PostgreSQLデータベースへの接続とクエリ実行
- ユーザー情報とロール管理のためのAPI
- JavaScript相互運用のためのラッパークラス
- 型安全なデータベース操作

## 主要なクラス

### DbClient

メインのデータベースクライアントクラス。各種リソースへのアクセスを提供します。

### HyperdrivePg

Cloudflare WorkersのHyperdriveとの相互運用を行うクラス。

## 使用方法

```dart
import 'package:db_client/db_client.dart';

// データベースクライアントの初期化
final dbClient = DbClient(db: hyperdrivePg);

// ユーザー情報とロールの取得
final userAndRoles = await dbClient.user.getUserAndUserRoles('user_id');

// ユーザーロールの更新
await dbClient.user.updateUserRoles('user_id', [Role.admin, Role.speaker]);
```

## 依存関係

- `db_types`: データベーステーブルの型定義
- `js_interop_utils`: JavaScript相互運用のためのユーティリティ
- `freezed_annotation`, `json_annotation`: コード生成のためのアノテーション

## 開発

### コード生成

```bash
dart run build_runner build
```

### テスト実行

```bash
dart test
```
