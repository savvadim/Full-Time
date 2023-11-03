import Foundation
import Moya

public let apiProvider = MoyaProvider<APIService>(
    plugins: [
        NetworkLoggerPlugin()
    ])

public enum APIService {
    case login(Parameters)
}

extension APIService: TargetType {
    public typealias Parameters = [String: Any]

    public var baseURL: URL { Constants.API.baseURL }

    public var path: String {
        {
            switch self {
            case .login:
                return "/auth/login"
            }
        }()
    }

    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }

    public var sampleData: Data { Data() }

    public var task: Task {
        switch self {
        case let .login(parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    public var headers: [String: String]? {
        [
            "Content-Type": "application/json",
        ]
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
