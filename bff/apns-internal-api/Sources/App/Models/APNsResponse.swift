import Vapor
import VaporToOpenAPI

/// APNs 送信結果
struct APNsResponse: Content, Sendable, OpenAPIDescriptable {
    /// 成功した送信数
    let successCount: Int

    /// 失敗した送信数
    let failureCount: Int

    /// 個別の結果
    let results: [APNsResult]
}

/// 個別の送信結果
struct APNsResult: Content, Sendable, OpenAPIDescriptable {
    /// 成功したかどうか
    let success: Bool

    /// APNs ID
    let apnsId: String?

    /// デバイストークン
    let deviceToken: String

    /// エラー情報
    let error: APNsErrorResponse?
}

/// APNs エラーレスポンス
struct APNsErrorResponse: Content, Sendable, OpenAPIDescriptable {
    /// エラー理由
    let reason: String

    /// エラーメッセージ
    let message: String?

    /// タイムスタンプ (トークンが無効になった時刻)
    let timestamp: Int?
}
