import Foundation
import Domain

public class LoginModels {
    
    private var email: String?
    private var password: String?
    private var network: LoginServiceProtocol = LoginService()
    
    open func onLogin() {
        network.login(with: .init(login: email ?? "",
                                  password: password ?? "")) { [weak self] result in
            if case let .success(response) = result {
//                if let error = response.error {
//                    if error.code == 1110 {
//                        self?.onEmailConfirm?()
//                    } else {
//                        self?.render {
//                            $0.error = error.message
//                        }
//                    }
//                } else {
//                    self?.render {
//                        $0.alert = true
//                    }
//                    self?.props?.alert = false
//                }
                
                print("succes")
            }
        }
    }
}
