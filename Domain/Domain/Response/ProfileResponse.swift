import Foundation

struct ProfileResponse: Codable {
    let name: String
    let surname: String
    let position: String
    let avatarLink: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case surname
        case position
        case avatarLink
        case email
    }
}
