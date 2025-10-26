import Vapor

/// API キー認証ミドルウェア
struct AuthMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        // Proxy-Authorization ヘッダーを取得
        guard let proxyAuth = request.headers.first(name: "proxy-authorization") else {
            throw Abort(.unauthorized, reason: "Proxy-Authorization header is required")
        }
        
        // 環境変数から API キーを取得
        guard let apiKey = Environment.get("X_API_KEY") else {
            request.logger.error("X_API_KEY environment variable is not set")
            throw Abort(.internalServerError, reason: "Server configuration error")
        }
        
        // API キーを検証
        guard proxyAuth == apiKey else {
            request.logger.warning("Invalid API key provided")
            throw Abort(.unauthorized, reason: "Unauthorized")
        }
        
        // 認証成功
        return try await next.respond(to: request)
    }
}
