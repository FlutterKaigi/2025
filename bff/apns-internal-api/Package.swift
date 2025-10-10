// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "apns-internal-api",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.106.3"),
        // 🍎 Apple Push Notification Service
        .package(url: "https://github.com/vapor/apns.git", from: "4.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .target(name: "App"),
            ]
        ),
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "APNS", package: "apns"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App"),
                .product(name: "XCTVapor", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        )
    ],
    swiftLanguageModes: [.v6]
)

var swiftSettings: [SwiftSetting] {
    [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("ConciseMagicFile"),
        .enableUpcomingFeature("ForwardTrailingClosures"),
        .enableUpcomingFeature("DisableOutwardActorInference"),
        .enableUpcomingFeature("StrictConcurrency"),
    ]
}
