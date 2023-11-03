import Foundation
import Domain

public class LoginModels {
    
    private var network: LoginServiceProtocol = LoginService()
    
    public init() {}
    
    open func onLogin(email: String, password: String) {
        network.login(with: .init(email: email, password: password)) { result in
            switch result {
            case .success(let response):
                if let token = response.token {
                    print("Успешный вход, токен: \(token)")
                    // Здесь вы можете выполнить дополнительные действия с токеном
                } else {
                    print("Ошибка: Токен отсутствует в ответе")
                }
            case .error(let error):
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
