import Foundation

extension URLRequest {
    public static func request(
        from urlString: String,
        httpMethod: String = "GET",
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    ) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.cachePolicy = cachePolicy
        return request
    }
}
