//
//  LoginResponse.swift
//  Domain
//
//  Created by Vladislav Skuratov on 10.12.2022.
//

import Foundation
import Networking

public struct LoginResponse: APIModelCodable {
    let token: String
}

//public struct Error: APIModelCodable {
//    public var message: String
//
//    public let code: Int
//    public let textCode: String
//    public let type: String
//    public let errorMessage: String
//}

//extension Error {
//    enum CodingKeys: String, CodingKey {
//        case code
//        case textCode
//        case type
//        case errorMessage = "message"
//    }
//}
