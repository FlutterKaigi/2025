import Vapor
import APNS

/// Live Activity の更新リクエスト
struct LiveActivityUpdateRequest: Content, Sendable {
    /// デバイストークン (Live Activity のプッシュトークン)
    let deviceToken: String
    
    /// Live Activity の状態データ
    let contentState: [String: String]
    
    /// アラート設定
    let alert: LiveActivityAlert?
    
    /// イベント (update, end)
    let event: LiveActivityEvent
    
    /// 優先度 (10 = 即座に配信, 5 = 省電力を考慮)
    let priority: Int?
    
    /// タイムスタンプ
    let timestamp: Int?
    
    /// トピック (通常はバンドルID.push-type.liveactivity)
    let topic: String?
}

/// Live Activity のアラート
struct LiveActivityAlert: Content, Sendable {
    /// タイトル
    let title: String?
    
    /// 本文
    let body: String?
    
    /// サウンド
    let sound: String?
}

/// Live Activity のイベントタイプ
enum LiveActivityEvent: String, Content, Sendable {
    /// 更新
    case update
    
    /// 終了
    case end
}

/// Live Activity バッチ送信リクエスト
struct BatchLiveActivityUpdateRequest: Content, Sendable {
    /// Live Activity 更新のリスト
    let updates: [LiveActivityUpdateRequest]
    
    /// 検証のみ (実際には送信しない)
    let validateOnly: Bool?
}
