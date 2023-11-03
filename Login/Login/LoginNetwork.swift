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
    
//    public func performLogin(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
//        let loginRequest = LoginRequestModel(login: username, password: password)
//
//        apiProvider.request(.login(LoginRequestModel: LoginRequestModel)) { result in
//            switch result {
//            case .success(let response):
//                do {
//                    let responseData = try response.map(LoginResponse.self) // Замените LoginResponseModel на свою модель для ответа
//                    completion(.success(responseData))
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }

}
