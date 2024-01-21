import Foundation
import Networking
import Domain
import UIKit

public class ProfileModel {
    
    private var network: ProfileServiceProtocol = ProfileService()
    
    public init() {}
    
    open func getProfile() {
        network.profile { result in
            switch result {
            case .success(let response):
                print("Успешно: \(response)")
                
            case .error(let error):
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
