import Vapor
import VaporToOpenAPI

func routes(_ app: Application) throws {
    // ヘルスチェックエンドポイント (認証不要)
    app.get("health") { req async -> Response in
        let healthStatus = [
            "status": "ok",
            "timestamp": ISO8601DateFormatter().string(from: Date())
        ]
        return try await healthStatus.encodeResponse(for: req)
    }
    .openAPI(
        summary: "Health Check",
        description: "サービスの稼働状況を確認するエンドポイント",
        response: .type(of: ["status": "ok", "timestamp": ""])
    )
    .openAPINoAuth()

    // OpenAPI ドキュメントエンドポイント
    app.get("openapi.json") { req in
        req.application.routes.openAPI(
            info: InfoObject(
                title: "APNs Internal API",
                description: "FlutterKaigi 2025 の APNs（Apple Push Notification service）通知配信を行うための内部 API",
                version: "1.0.0"
            ),
            servers: [
                ServerObject(
                    url: "http://localhost:8080",
                    description: "開発環境"
                )
            ]
        )
    }
    .excludeFromOpenAPI()

    // 認証が必要なエンドポイント
    let protected = app.grouped(AuthMiddleware())
        .groupedOpenAPI(auth: .apiKey(name: "Proxy-Authorization", location: .header))

    // APNs コントローラーを登録
    try protected.register(collection: APNsController())
}
