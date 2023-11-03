import Foundation
import Domain

public class LoginModels {
    
    private var email: String?
    private var password: String?
    private var network: LoginServiceProtocol = LoginService()
    
    public init() {}
    
    open func onLogin() {
        network.login(with: .init(login: email ?? "",
                                  password: password ?? "")) { result in
            if case let .success(response) = result {
                if let error = response.error {
                    print(response.error!)
                }
                print("succes")
            }
        }
    }
}
