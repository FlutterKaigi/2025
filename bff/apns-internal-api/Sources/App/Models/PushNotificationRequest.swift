import Vapor
import APNS
import VaporToOpenAPI

/// プッシュ通知のリクエスト
struct PushNotificationRequest: Content, Sendable, OpenAPIDescriptable {
    /// デバイストークン
    let deviceToken: String

    /// 通知のペイロード
    let notification: NotificationPayload

    /// カスタムデータ
    let customData: [String: String]?

    /// 優先度 (10 = 即座に配信, 5 = 省電力を考慮)
    let priority: Int?

    /// 有効期限 (Unix タイムスタンプ)
    let expiration: Int?

    /// トピック (通常はバンドルID)
    let topic: String?

    /// 折りたたみID
    let collapseId: String?
}

/// 通知ペイロード
struct NotificationPayload: Content, Sendable, OpenAPIDescriptable {
    /// タイトル
    let title: String?

    /// サブタイトル
    let subtitle: String?

    /// 本文
    let body: String

    /// バッジ数
    let badge: Int?

    /// サウンド
    let sound: String?

    /// カテゴリー
    let category: String?

    /// スレッドID
    let threadId: String?
}

/// バッチ送信リクエスト
struct BatchPushNotificationRequest: Content, Sendable, OpenAPIDescriptable {
    /// 通知のリスト
    let notifications: [PushNotificationRequest]

    /// 検証のみ (実際には送信しない)
    let validateOnly: Bool?
}
