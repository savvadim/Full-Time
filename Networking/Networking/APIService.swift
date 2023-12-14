import Foundation
import Moya

public let apiProvider = MoyaProvider<APIService>(
    plugins: [
        NetworkLoggerPlugin()
    ])

public enum APIService {
    case login(Parameters)
    case profile
}

extension APIService: TargetType {
    public typealias Parameters = [String: Any]

    public var baseURL: URL { Constants.API.baseURL }

    public var path: String {
        {
            switch self {
            case .login:
                return "/auth/login"
                
            case .profile:
                return "/user"
            }
        }()
    }

    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
            
        case .profile:
            return .get
        }
    }

    public var sampleData: Data { Data() }

    public var task: Task {
        switch self {
        case let .login(parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .profile:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
    
        guard let token = TokenManager.currentToken() else {
                return nil
            }
        
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
            
        case .profile:
            
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
    
    public var fullURL: String {
        do {
            let request = try apiProvider.endpoint(self).urlRequest()

            return request.url?.absoluteString ?? ""
        } catch {
            return ""
        }
    }
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
