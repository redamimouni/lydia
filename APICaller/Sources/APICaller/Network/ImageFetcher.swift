import Foundation

public protocol ImageFetcherProtocol {
    func fetchImageData(from url: String) async throws -> Data
}

public final class ImageFetcher: ImageFetcherProtocol {
    private let urlSession: URLSessionProtocol

    public init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }

    public func fetchImageData(from url: String) async throws -> Data {
        return try await urlSession.data(from: url)
    }
}
