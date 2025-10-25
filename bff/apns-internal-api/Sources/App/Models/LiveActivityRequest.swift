import Vapor
import APNS

/// Live Activity の更新リクエスト
struct LiveActivityUpdateRequest: Content, Sendable {
    /// デバイストークン (Live Activity のプッシュトークン)
    let deviceToken: String

    /// Live Activity の状態データ (動的コンテンツ)
    let contentState: [String: AnyCodable]

    /// アラート設定
    let alert: LiveActivityAlert?

    /// イベント (start, update, end)
    let event: LiveActivityEvent

    /// 優先度 (10 = 即座に配信, 5 = 省電力を考慮)
    let priority: Int?

    /// タイムスタンプ (Unix エポックからの秒数)
    let timestamp: Int?

    /// トピック (通常はバンドルID.push-type.liveactivity)
    let topic: String?

    /// Live Activity の属性 (start イベントでのみ使用)
    let attributes: [String: AnyCodable]?

    /// Live Activity の属性タイプ (start イベントでのみ使用)
    let attributesType: String?

    /// Live Activity が古くなる日時 (Unix エポックからの秒数)
    let staleDate: Int?

    /// Live Activity を削除する日時 (end イベントでのみ使用、Unix エポックからの秒数)
    let dismissalDate: Int?

    /// 関連性スコア (0.0 ~ 1.0)
    let relevanceScore: Double?
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
    /// 開始
    case start

    /// 更新
    case update

    /// 終了
    case end
}

/// 任意の Codable 値をラップする型
struct AnyCodable: Codable, Sendable {
    let value: Any

    init(_ value: Any) {
        self.value = value
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let bool = try? container.decode(Bool.self) {
            value = bool
        } else if let int = try? container.decode(Int.self) {
            value = int
        } else if let double = try? container.decode(Double.self) {
            value = double
        } else if let string = try? container.decode(String.self) {
            value = string
        } else if let array = try? container.decode([AnyCodable].self) {
            value = array.map { $0.value }
        } else if let dictionary = try? container.decode([String: AnyCodable].self) {
            value = dictionary.mapValues { $0.value }
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unsupported type")
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()

        switch value {
        case let bool as Bool:
            try container.encode(bool)
        case let int as Int:
            try container.encode(int)
        case let double as Double:
            try container.encode(double)
        case let string as String:
            try container.encode(string)
        case let array as [Any]:
            try container.encode(array.map { AnyCodable($0) })
        case let dictionary as [String: Any]:
            try container.encode(dictionary.mapValues { AnyCodable($0) })
        default:
            let context = EncodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Unsupported type: \(type(of: value))"
            )
            throw EncodingError.invalidValue(value, context)
        }
    }
}

/// Live Activity バッチ送信リクエスト
struct BatchLiveActivityUpdateRequest: Content, Sendable, OpenAPIDescriptable {
    /// Live Activity 更新のリスト
    let updates: [LiveActivityUpdateRequest]

    /// 検証のみ (実際には送信しない)
    let validateOnly: Bool?
}
