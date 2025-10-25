import Vapor
import APNS
import APNSCore

/// アプリケーションを設定します
public func configure(_ app: Application) async throws {
    // ログレベルの設定
    app.logger.logLevel = Environment.get("LOG_LEVEL")
        .flatMap { Logger.Level(rawValue: $0) } ?? .info
    
    app.logger.info("Configuring APNs Internal API")
    
    // サーバー設定
    let port = Environment.get("PORT").flatMap(Int.init) ?? 8080
    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = port
    
    app.logger.info("Server will listen on port \(port)")
    
    // APNs 設定を取得
    let apnsEnvironment = Environment.get("APNS_ENVIRONMENT") ?? "sandbox"
    let apnsKeyId = Environment.get("APNS_KEY_ID")
    let apnsTeamId = Environment.get("APNS_TEAM_ID")
    let apnsPrivateKey = Environment.get("APNS_PRIVATE_KEY")
    
    // APNs の設定を検証
    guard let keyId = apnsKeyId, !keyId.isEmpty else {
        app.logger.error("APNS_KEY_ID environment variable is required")
        throw Abort(.internalServerError, reason: "APNS_KEY_ID is not configured")
    }
    
    guard let teamId = apnsTeamId, !teamId.isEmpty else {
        app.logger.error("APNS_TEAM_ID environment variable is required")
        throw Abort(.internalServerError, reason: "APNS_TEAM_ID is not configured")
    }
    
    guard let privateKey = apnsPrivateKey, !privateKey.isEmpty else {
        app.logger.error("APNS_PRIVATE_KEY environment variable is required")
        throw Abort(.internalServerError, reason: "APNS_PRIVATE_KEY is not configured")
    }
    
    // APNs 環境を決定
    let environment: APNSEnvironment = apnsEnvironment == "production" ? .production : .sandbox
    
    app.logger.info("Configuring APNs", metadata: [
        "environment": .string(apnsEnvironment),
        "keyId": .string(keyId),
        "teamId": .string(teamId)
    ])
    
    // APNs クライアントを設定
    app.apns.configuration = try .init(
        authenticationMethod: .jwt(
            privateKey: .loadFrom(string: privateKey),
            keyIdentifier: keyId,
            teamIdentifier: teamId
        ),
        environment: environment
    )
    
    app.logger.info("APNs client configured successfully")
    
    // ルートを登録
    try routes(app)
}
