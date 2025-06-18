import Foundation

public enum CustomError: LocalizedError {
    case httpRequestError
    case errorDataFetch
    case parsingError
    case wrongUrlError
    case typeConversionError

    public var errorDescription: String? {
        switch self {
        case .httpRequestError:
            return "HTTP request error"
        case .errorDataFetch:
            return "Fetching data error"
        case .parsingError:
            return "Parsing data error"
        case .wrongUrlError:
            return "Wrong url error"
        case .typeConversionError:
            return "Type conversion error"
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .httpRequestError:
            return "Failed due to HTTP request error"
        case .errorDataFetch:
            return "Failed due to error data fetch"
        case .parsingError:
            return "Failed due to parsing error"
        case .wrongUrlError:
            return "Failed due to wrong url error"
        case .typeConversionError:
            return "Failed due to type conversion error"
        }
    }
}
