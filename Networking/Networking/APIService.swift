//
//  APIService.swift
//  Networking
//
//  Created by Vladislav Skuratov on 09.12.2022.
//

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

    public var baseURL: URL { URL(fileReferenceLiteralResourceName: "") } // TODO: Ваш base url

    var service: String {
        switch self {
        case .login:
            return "api"
        }
    }

    public var path: String {
        service + {
            switch self {
            case .login:
                return "/employees/login"
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
}
