import Foundation
import Networking
import Domain

protocol ProfileServiceProtocol: ServiceProtocol {
    func profile(completion: @escaping ((APIResult<ProfileResponse>) -> Void))
}

final class ProfileService: NetworkProvider, ProfileServiceProtocol {
    func profile(completion: @escaping ((APIResult<ProfileResponse>) -> Void)) {
        
        apiProvider.request(.profile) { [weak self] result in
            self?.handle(target: .profile, result: result, completion: completion)
        }
    }
}
