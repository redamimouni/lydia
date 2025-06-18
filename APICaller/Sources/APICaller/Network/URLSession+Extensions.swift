import Foundation

public protocol URLSessionProtocol: Sendable {
    func dataWithFallback(with request: URLRequest) async throws -> (Data, URLResponse)
    func data(with request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    public func dataWithFallback(with request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await data(with: request)
        } catch {
            if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
                return (cachedResponse.data, cachedResponse.response)
            } else {
                throw error
            }
        }
    }
    
    public func data(with request: URLRequest) async throws -> (Data, URLResponse) {
        let result = try await data(for: request)
        return result
    }
}
