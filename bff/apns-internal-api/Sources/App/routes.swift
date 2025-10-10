import Vapor

func routes(_ app: Application) throws {
    // ヘルスチェックエンドポイント (認証不要)
    app.get("health") { req async -> Response in
        let healthStatus = [
            "status": "ok",
            "timestamp": ISO8601DateFormatter().string(from: Date())
        ]
        return try await healthStatus.encodeResponse(for: req)
    }
    
    // 認証が必要なエンドポイント
    let protected = app.grouped(AuthMiddleware())
    
    // APNs コントローラーを登録
    try protected.register(collection: APNsController())
}
