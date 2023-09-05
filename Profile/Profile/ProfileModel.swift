import Foundation

struct Post: Codable {
    let name: String
    let surname: String
    let position: String
    let avatar: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case surname
        case position
        case avatar
        case email
    }
}
