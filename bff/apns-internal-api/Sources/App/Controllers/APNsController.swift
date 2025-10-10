import Vapor
import APNS
import APNSCore

/// APNs 通知を送信するコントローラー
struct APNsController: RouteCollection, Sendable {
    func boot(routes: any RoutesBuilder) throws {
        let apns = routes.grouped("apns")
        
        // プッシュ通知のバッチ送信
        apns.post("push", "batch", use: sendBatchPushNotifications)
        
        // Live Activity のバッチ更新
        apns.post("live-activity", "batch", use: sendBatchLiveActivityUpdates)
    }
    
    /// プッシュ通知をバッチ送信
    @Sendable
    func sendBatchPushNotifications(req: Request) async throws -> APNsResponse {
        let request = try req.content.decode(BatchPushNotificationRequest.self)
        let validateOnly = request.validateOnly ?? false
        
        req.logger.info("Sending batch push notifications", metadata: [
            "count": "\(request.notifications.count)",
            "validateOnly": "\(validateOnly)"
        ])
        
        var results: [APNsResult] = []
        var successCount = 0
        var failureCount = 0
        
        for notification in request.notifications {
            do {
                // APNs アラートを構築
                let alert = APNSAlertNotification(
                    alert: .init(
                        title: .raw(notification.notification.title ?? ""),
                        subtitle: notification.notification.subtitle.map { .raw($0) },
                        body: .raw(notification.notification.body),
                        launchImage: nil
                    ),
                    expiration: notification.expiration.map { .immediately },
                    priority: notification.priority.map { .init(rawValue: $0) } ?? .immediately,
                    topic: notification.topic ?? "",
                    collapseIdentifier: notification.collapseId,
                    badge: notification.notification.badge,
                    sound: notification.notification.sound.map { .normal($0) },
                    contentAvailable: false,
                    mutableContent: false,
                    category: notification.notification.category,
                    threadID: notification.notification.threadId,
                    customData: notification.customData ?? [:]
                )
                
                // 検証のみモードでない場合は実際に送信
                if !validateOnly {
                    try await req.apns.client.sendAlertNotification(
                        alert,
                        deviceToken: notification.deviceToken,
                        deadline: .distantFuture
                    )
                }
                
                results.append(APNsResult(
                    success: true,
                    apnsId: nil,
                    deviceToken: notification.deviceToken,
                    error: nil
                ))
                successCount += 1
                
                req.logger.info("Push notification sent successfully", metadata: [
                    "deviceToken": .string(String(notification.deviceToken.prefix(10)) + "...")
                ])
            } catch let error as APNSCore.APNSError {
                results.append(APNsResult(
                    success: false,
                    apnsId: nil,
                    deviceToken: notification.deviceToken,
                    error: APNsErrorResponse(
                        reason: "\(error)",
                        message: error.localizedDescription,
                        timestamp: nil
                    )
                ))
                failureCount += 1
                
                req.logger.error("Failed to send push notification", metadata: [
                    "deviceToken": .string(String(notification.deviceToken.prefix(10)) + "..."),
                    "error": .string("\(error)")
                ])
            } catch {
                results.append(APNsResult(
                    success: false,
                    apnsId: nil,
                    deviceToken: notification.deviceToken,
                    error: APNsErrorResponse(
                        reason: "unknown_error",
                        message: error.localizedDescription,
                        timestamp: nil
                    )
                ))
                failureCount += 1
                
                req.logger.error("Failed to send push notification with unknown error", metadata: [
                    "deviceToken": .string(String(notification.deviceToken.prefix(10)) + "..."),
                    "error": .string("\(error)")
                ])
            }
        }
        
        return APNsResponse(
            successCount: successCount,
            failureCount: failureCount,
            results: results
        )
    }
    
    /// Live Activity をバッチ更新
    @Sendable
    func sendBatchLiveActivityUpdates(req: Request) async throws -> APNsResponse {
        let request = try req.content.decode(BatchLiveActivityUpdateRequest.self)
        let validateOnly = request.validateOnly ?? false
        
        req.logger.info("Sending batch live activity updates", metadata: [
            "count": "\(request.updates.count)",
            "validateOnly": "\(validateOnly)"
        ])
        
        var results: [APNsResult] = []
        var successCount = 0
        var failureCount = 0
        
        for update in request.updates {
            do {
                // Live Activity ペイロードを構築
                var payload: [String: Any] = [
                    "aps": [
                        "timestamp": update.timestamp ?? Int(Date().timeIntervalSince1970),
                        "event": update.event.rawValue,
                        "content-state": update.contentState
                    ] as [String: Any]
                ]
                
                // アラートがある場合は追加
                if let alert = update.alert {
                    var apsDict = payload["aps"] as? [String: Any] ?? [:]
                    var alertDict: [String: String] = [:]
                    
                    if let title = alert.title {
                        alertDict["title"] = title
                    }
                    if let body = alert.body {
                        alertDict["body"] = body
                    }
                    if let sound = alert.sound {
                        alertDict["sound"] = sound
                    }
                    
                    if !alertDict.isEmpty {
                        apsDict["alert"] = alertDict
                    }
                    
                    payload["aps"] = apsDict
                }
                
                // JSON エンコード
                let jsonData = try JSONSerialization.data(withJSONObject: payload)
                guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                    throw Abort(.internalServerError, reason: "Failed to encode JSON")
                }
                
                // 検証のみモードでない場合は実際に送信
                if !validateOnly {
                    try await req.apns.client.send(
                        rawBytes: ByteBuffer(string: jsonString),
                        pushType: .liveactivity,
                        to: update.deviceToken,
                        topic: update.topic ?? "",
                        priority: update.priority.map { .init(rawValue: $0) } ?? .immediately,
                        deadline: .distantFuture
                    )
                }
                
                results.append(APNsResult(
                    success: true,
                    apnsId: nil,
                    deviceToken: update.deviceToken,
                    error: nil
                ))
                successCount += 1
                
                req.logger.info("Live activity updated successfully", metadata: [
                    "deviceToken": .string(String(update.deviceToken.prefix(10)) + "..."),
                    "event": .string(update.event.rawValue)
                ])
            } catch let error as APNSCore.APNSError {
                results.append(APNsResult(
                    success: false,
                    apnsId: nil,
                    deviceToken: update.deviceToken,
                    error: APNsErrorResponse(
                        reason: "\(error)",
                        message: error.localizedDescription,
                        timestamp: nil
                    )
                ))
                failureCount += 1
                
                req.logger.error("Failed to update live activity", metadata: [
                    "deviceToken": .string(String(update.deviceToken.prefix(10)) + "..."),
                    "error": .string("\(error)")
                ])
            } catch {
                results.append(APNsResult(
                    success: false,
                    apnsId: nil,
                    deviceToken: update.deviceToken,
                    error: APNsErrorResponse(
                        reason: "unknown_error",
                        message: error.localizedDescription,
                        timestamp: nil
                    )
                ))
                failureCount += 1
                
                req.logger.error("Failed to update live activity with unknown error", metadata: [
                    "deviceToken": .string(String(update.deviceToken.prefix(10)) + "..."),
                    "error": .string("\(error)")
                ])
            }
        }
        
        return APNsResponse(
            successCount: successCount,
            failureCount: failureCount,
            results: results
        )
    }
}
