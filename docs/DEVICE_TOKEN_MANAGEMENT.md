# デバイストークン管理

## 概要

FlutterKaigi 2025アプリのプッシュ通知とLive Activity機能のために、デバイストークン（APNs/FCM）を管理するデータベース設計。

## テーブル構成

### 1. `devices`

デバイス基本情報を管理するマスターテーブル。

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|-----|------|
| id | VARCHAR(64) | PRIMARY KEY | デバイス識別子のSHA-256ハッシュ値 |
| user_id | UUID | REFERENCES auth.users(id) ON DELETE CASCADE | ユーザーID |
| device_type | device_type_enum | NOT NULL | デバイス種別 (ios/android/web) |
| created_at | TIMESTAMP | NOT NULL DEFAULT now() | 作成日時 |

**PRIMARY KEY**: `(user_id, id)`

**注意点**:

- デバイスIDはクライアント側で生成したユニークIDをSHA-256でハッシュ化して保存
- 1ユーザーが複数デバイスを持つことを想定
- デバイスタイプはenum型で管理し、型安全性を確保

### 2. `device_apns_tokens`

iOS向けAPNs (Apple Push Notification service) トークンを管理。

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|-----|------|
| device_id | VARCHAR(64) | REFERENCES devices(id) ON DELETE CASCADE | デバイスID |
| token | TEXT | NOT NULL | APNsトークン |
| token_type | apns_token_type_enum | NOT NULL | トークン種別 |
| created_at | TIMESTAMP | NOT NULL DEFAULT now() | 作成日時 |
| updated_at | TIMESTAMP | NOT NULL DEFAULT now() | 更新日時 |

**PRIMARY KEY**: `(device_id, token_type)`

**トークン種別**:

- `push`: 通常のプッシュ通知用デバイストークン
- `voip`: VoIP通知用トークン（将来的な拡張用）
- `live_activity`: Live Activity更新用トークン

**注意点**:

- ActivityKitでは、Live Activityごとに一時的なpush tokenが発行される
- 本設計では、アプリ全体で1つのLive Activity運用を想定し、デバイスごとに1つのLive Activityトークンを管理
- 複数のLive Activityを同時運用する場合は、別途`live_activities`テーブルを作成して管理することを推奨
- `updated_at`はトークン更新時に自動更新

### 3. `device_fcm_tokens`

Android/Web向けFCM (Firebase Cloud Messaging) トークンを管理。

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|-----|------|
| device_id | VARCHAR(64) | PRIMARY KEY REFERENCES devices(id) ON DELETE CASCADE | デバイスID |
| token | TEXT | NOT NULL | FCMトークン |
| created_at | TIMESTAMP | NOT NULL DEFAULT now() | 作成日時 |
| updated_at | TIMESTAMP | NOT NULL DEFAULT now() | 更新日時 |

**注意点**:

- FCMでは単一のトークンで全ての通知タイプに対応
- `updated_at`はトークン更新時に自動更新
- トークンは定期的に再発行される可能性があるため、更新処理が必要

## Enum型定義

```sql
CREATE TYPE device_type_enum AS ENUM ('ios', 'android', 'web');
CREATE TYPE apns_token_type_enum AS ENUM ('push', 'voip', 'live_activity');
```

## Row Level Security (RLS)

全テーブルでRLSを有効化し、以下のポリシーを適用：

- **SELECT/INSERT/UPDATE/DELETE**: 自分のユーザーIDに紐づくデバイストークンのみ操作可能
- **service_role**: 全ての操作が可能（バックエンドからのトークン管理用）

## トークン更新フロー

### APNsトークン

1. アプリ起動時にAPNsからデバイストークンを取得
2. トークンが変更されている場合、`device_apns_tokens`を`UPSERT`
3. Live Activity開始時にpush tokenを取得し、`token_type='live_activity'`として保存

### FCMトークン

1. アプリ起動時にFCMからトークンを取得
2. トークンが変更されている場合、`device_fcm_tokens`を`UPSERT`
3. トークン更新通知を受け取った際も同様に`UPSERT`

## インデックス

- `devices`: `(user_id)` - ユーザーごとのデバイス一覧取得を高速化
- `device_apns_tokens`: `(device_id)` - デバイスごとのトークン取得を高速化（外部キーで自動作成）
- `device_fcm_tokens`: `(device_id)` - 主キーで自動作成

## 参考資料

- [Starting and updating Live Activities with ActivityKit push notifications | Apple Developer Documentation](https://developer.apple.com/documentation/activitykit/starting-and-updating-live-activities-with-activitykit-push-notifications)
- [ActivityKit Push Notification](https://developer.apple.com/documentation/activitykit/activitykit-push-notifications)
- [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)

## 将来的な拡張案

### 複数Live Activity対応

複数のLive Activityを同時運用する場合：

```sql
CREATE TABLE live_activities (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v7(),
  device_id VARCHAR(64) REFERENCES devices(id) ON DELETE CASCADE,
  activity_id TEXT NOT NULL,  -- ActivityKitが発行するActivity ID
  push_token TEXT NOT NULL,   -- Live Activity用push token
  status live_activity_status_enum NOT NULL,  -- active/ended
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now(),
  ended_at TIMESTAMP
);
```

### トークン履歴管理

トラブルシューティング用にトークン変更履歴を保存する場合は、各トークンテーブルに`*_history`テーブルを追加。
