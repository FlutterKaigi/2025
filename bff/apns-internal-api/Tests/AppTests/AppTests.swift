@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testHealthEndpoint() async throws {
        let app = try await Application.make(.testing)
        defer { Task { try await app.asyncShutdown() } }
        
        try await configure(app)
        
        try await app.test(.GET, "health") { res async in
            XCTAssertEqual(res.status, .ok)
            XCTAssertTrue(res.body.string.contains("ok"))
        }
    }
}
