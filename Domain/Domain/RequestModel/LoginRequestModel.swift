import Foundation
import Networking

public struct LoginRequestModel: APIModelCodable {
    private let login: String
    private let password: String

    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
