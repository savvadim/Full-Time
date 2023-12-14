import Foundation

public enum AppError: Error {
    case network(Error)
    case data(Error, Int)
    case api(Error, Int)
    case unknown(Int)
    
    public var userInfo: [String: String] {
        switch self {
        case let .network(error):
            return error._userInfo as? [String: String] ?? [:]
            
        case let .data(error, _):
            return error._userInfo as? [String: String] ?? [:]

        case let .api(error, _):
            return error._userInfo as? [String: String] ?? [:]

        case .unknown:
            return [:]
        }
    }
}
