import Foundation

public struct APIEndpoints {
    public static func listing(with limit: Int, page: Int) -> String {
        "\(APIConstants.baseURL.rawValue)/?page=\(page)&results=\(limit)"
    }
}
