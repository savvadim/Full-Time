import Foundation
import Networking
import Domain

protocol LoginServiceProtocol: ServiceProtocol {
    func login(with request: LoginRequestModel, completion: @escaping ((APIResult<LoginResponse>) -> Void))
}

final class LoginService: NetworkProvider, LoginServiceProtocol { }

// MARK: - Login
extension LoginService {
    public func login(with request: LoginRequestModel, completion: @escaping ((APIResult<LoginResponse>) -> Void)) {
        guard let parameters = try? request.dictionary() else { return }
        
        apiProvider.request(.login(parameters)) { [weak self] result in
            self?.handle(target: .login(parameters), result: result, completion: completion)
        }
    }
}
