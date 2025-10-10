import Vapor
import Logging

@main
struct Main {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        
        let app = try await Application.make(env)
        
        // Graceful shutdown
        let signalQueue = DispatchQueue(label: "com.flutterkaigi.apns-internal-api.signal")
        signal(SIGTERM, SIG_IGN)
        signal(SIGINT, SIG_IGN)
        
        let signalSource = DispatchSource.makeSignalSource(signal: SIGTERM, queue: signalQueue)
        signalSource.setEventHandler {
            signalSource.cancel()
            app.logger.info("Received SIGTERM, shutting down gracefully")
            app.shutdown()
        }
        signalSource.resume()
        
        let intSource = DispatchSource.makeSignalSource(signal: SIGINT, queue: signalQueue)
        intSource.setEventHandler {
            intSource.cancel()
            app.logger.info("Received SIGINT, shutting down gracefully")
            app.shutdown()
        }
        intSource.resume()
        
        do {
            try await configure(app)
        } catch {
            app.logger.report(error: error)
            try await app.asyncShutdown()
            throw error
        }
        
        try await app.execute()
        try await app.asyncShutdown()
    }
}
