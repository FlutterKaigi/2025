# Live Activity Push Notifications 実装仕様

このドキュメントは、Apple の公式仕様に準拠した Live Activity Push Notifications の実装詳細を説明します。

## 参考資料

- [Starting and updating Live Activities with ActivityKit push notifications](https://developer.apple.com/documentation/activitykit/starting-and-updating-live-activities-with-activitykit-push-notifications)
- [Updating and ending your Live Activity with ActivityKit push notifications](https://developer.apple.com/documentation/activitykit/updating-and-ending-your-live-activity-with-activitykit-push-notifications)

## ペイロード構造

### 基本構造

すべての Live Activity プッシュ通知は以下の基本構造を持ちます：

```json
{
  "aps": {
    "timestamp": 1234567890,
    "event": "update",
    "content-state": {/* 動的コンテンツ */}
  }
}
```

### イベントタイプ

#### 1. start - Live Activity を開始

Live Activity を開始する際に使用します。

**必須フィールド:**

- `event`: "start"
- `content-state`: 初期状態の動的コンテンツ
- `attributes`: Live Activity の静的属性
- `attributes-type`: 属性の型名（ActivityAttributes プロトコルに準拠した型名）

**オプションフィールド:**

- `timestamp`: イベントのタイムスタンプ（デフォルト: 現在時刻）
- `stale-date`: Live Activity が古くなる日時
- `relevance-score`: 関連性スコア（0.0 〜 1.0）
- `alert`: 通知アラート

**例:**

```json
{
  "aps": {
    "timestamp": 1696896000,
    "event": "start",
    "content-state": {
      "driverName": "田中太郎",
      "estimatedDeliveryTime": 1696896000
    },
    "attributes": {
      "orderId": "ORDER-12345"
    },
    "attributes-type": "DeliveryActivityAttributes",
    "stale-date": 1696899600,
    "relevance-score": 0.9,
    "alert": {
      "title": "配達開始",
      "body": "配達が開始されました"
    }
  }
}
```

#### 2. update - Live Activity を更新

既存の Live Activity を更新する際に使用します。

**必須フィールド:**

- `event`: "update"
- `content-state`: 更新後の動的コンテンツ

**オプションフィールド:**

- `timestamp`: イベントのタイムスタンプ
- `stale-date`: Live Activity が古くなる日時
- `relevance-score`: 関連性スコア（0.0 〜 1.0）
- `alert`: 通知アラート

**例:**

```json
{
  "aps": {
    "timestamp": 1696896200,
    "event": "update",
    "content-state": {
      "driverName": "田中太郎",
      "estimatedDeliveryTime": 1696896300
    },
    "stale-date": 1696899600,
    "relevance-score": 0.95,
    "alert": {
      "title": "配達状況更新",
      "body": "あと5分で到着予定です"
    }
  }
}
```

#### 3. end - Live Activity を終了

Live Activity を終了する際に使用します。

**必須フィールド:**

- `event`: "end"
- `content-state`: 最終状態の動的コンテンツ

**オプションフィールド:**

- `timestamp`: イベントのタイムスタンプ
- `dismissal-date`: Live Activity を画面から削除する日時
- `alert`: 通知アラート

**例:**

```json
{
  "aps": {
    "timestamp": 1696896500,
    "event": "end",
    "content-state": {
      "driverName": "田中太郎",
      "estimatedDeliveryTime": 1696896500
    },
    "dismissal-date": 1696900100,
    "alert": {
      "title": "配達完了",
      "body": "ご注文の商品が配達されました"
    }
  }
}
```

## フィールド詳細

### content-state

Live Activity の動的コンテンツを表します。任意の JSON オブジェクトを指定できます。

- **型**: オブジェクト
- **必須**: はい
- **説明**: ActivityAttributes の ContentState プロトコルに準拠した構造体に対応する JSON オブジェクト

### attributes

Live Activity の静的属性を表します。`start` イベントでのみ使用します。

- **型**: オブジェクト
- **必須**: start イベントの場合は推奨
- **説明**: ActivityAttributes プロトコルに準拠した構造体のプロパティに対応する JSON オブジェクト

### attributes-type

属性の型名を指定します。`start` イベントでのみ使用します。

- **型**: 文字列
- **必須**: start イベントの場合は推奨
- **説明**: ActivityAttributes プロトコルに準拠した型の名前

### timestamp

イベントが発生した時刻を指定します。

- **型**: 整数（Unix エポックからの秒数）
- **必須**: いいえ（デフォルト: 現在時刻）
- **説明**: Live Activity の UI でこのタイムスタンプを使用して時間を表示できます

### stale-date

Live Activity が古くなる日時を指定します。

- **型**: 整数（Unix エポックからの秒数）
- **必須**: いいえ
- **説明**: この時刻を過ぎると、Live Activity は視覚的に古いものとしてマークされます

### dismissal-date

Live Activity を画面から削除する日時を指定します。`end` イベントでのみ使用します。

- **型**: 整数（Unix エポックからの秒数）
- **必須**: いいえ
- **説明**: この時刻になると、Live Activity は自動的に画面から削除されます。指定しない場合は、ユーザーが手動で削除するまで表示されます。

### relevance-score

Live Activity の関連性スコアを指定します。

- **型**: 数値（0.0 〜 1.0）
- **必須**: いいえ
- **説明**: スコアが高いほど、ユーザーにとって重要な更新であることを示します。システムは、このスコアを使用して Live Activity の表示優先度を決定する場合があります。

### alert

プッシュ通知アラートを指定します。

- **型**: オブジェクト
- **必須**: いいえ
- **説明**: Live Activity の更新時に通知バナーを表示する場合に使用します。サイレント更新の場合は省略します。

**alert のフィールド:**

- `title`: 通知のタイトル（文字列、オプション）
- `body`: 通知の本文（文字列、オプション）
- `sound`: 通知音（文字列、オプション、例: "default"）

## 実装のベストプラクティス

### 1. event タイプの適切な使用

- **start**: Live Activity を初めて開始する際のみ使用
- **update**: Live Activity の状態を更新する際に使用（最も頻繁に使用）
- **end**: Live Activity を終了する際に使用

### 2. timestamp の活用

`timestamp` を適切に設定することで、ネットワークの遅延があっても正確な時刻情報を表示できます。

### 3. stale-date の設定

配達予定時刻など、情報が古くなるタイミングが明確な場合は `stale-date` を設定することを推奨します。

### 4. dismissal-date の使用

Live Activity を自動的に削除したい場合（例: イベント終了後 1 時間）は、`dismissal-date` を設定します。

### 5. relevance-score の活用

重要な更新（配達到着直前など）には高い `relevance-score` を設定し、通常の更新には低い値を設定します。

### 6. alert の使用判断

すべての更新で通知バナーを表示する必要はありません。重要な状態変化のみ `alert` を含めることで、ユーザー体験を向上させます。

## HTTP ヘッダー

APNs へのリクエストには以下のヘッダーを設定します：

- `apns-push-type`: "liveactivity"
- `apns-topic`: "{bundle-id}.push-type.liveactivity"
- `apns-priority`: 10（即時配信）または 5（省電力モード考慮）

## エラーハンドリング

Live Activity プッシュ通知で発生する可能性のある一般的なエラー：

- `BadDeviceToken`: デバイストークンが無効
- `Unregistered`: Live Activity が既に終了している
- `PayloadTooLarge`: ペイロードサイズが制限（4KB）を超えている
- `BadTopic`: トピックが正しくない

## 制限事項

- ペイロードの最大サイズ: 4KB
- Live Activity の最大同時表示数: デバイスによって異なる（通常は 1-2 個）
- Live Activity の最大継続時間: 8 時間（それ以降は自動的に終了）

## セキュリティ考慮事項

1. Live Activity プッシュトークンは機密情報として扱う
2. ペイロードに個人情報を含める場合は暗号化を検討
3. 認証されたユーザーのみが Live Activity を更新できるようにする
