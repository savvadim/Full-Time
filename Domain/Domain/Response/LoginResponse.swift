import Foundation
import Networking

public struct LoginResponse: APIModelCodable {
    public let token: String?
    public let error: Error?
}

public struct Error: APIModelCodable {
    public var message: String { textCode }

    public let code: Int
    public let textCode: String
    public let type: String
    public let errorMessage: String
}

extension Error {
    enum CodingKeys: String, CodingKey {
        case code
        case textCode
        case type
        case errorMessage = "message"
    }
}
