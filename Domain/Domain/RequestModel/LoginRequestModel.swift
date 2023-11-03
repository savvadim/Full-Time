import Foundation
import Networking

public struct LoginRequestModel: APIModelCodable {
    private let email: String
    private let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
