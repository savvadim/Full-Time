import Foundation
import Networking
import Domain
import UIKit

public class LoginModels {
    
    private var network: LoginServiceProtocol = LoginService()
    
    public init() {}
    
    open func onLogin(email: String, password: String) {
        network.login(with: .init(email: email, password: password)) { result in
            switch result {
            case .success(let response):
                
                if let token = response.token {
                    print("Успешный вход, токен: \(token)")
                    
                    TokenManager.saveToken(token, forAccount: " \(email)")
                    
                    let tabBarController = TabBarController()
                    let window = UIApplication.shared.windows.first

                    tabBarController.view.alpha = 0.0
                    window?.rootViewController = tabBarController

                    UIView.animate(withDuration: 0.3) {
                        tabBarController.view.alpha = 1.0
                    }

                    window?.makeKeyAndVisible()
                    
                } else {
                    print("Ошибка: Токен отсутствует в ответе")
                }
            case .error(let error):
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
