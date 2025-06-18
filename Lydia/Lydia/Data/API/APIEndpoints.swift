import Foundation

public struct APIEndpoints {
    public static func listing(with limit: Int) -> String {
        "\(APIConstants.baseURL.rawValue)/?results=\(limit)"
    }
}
