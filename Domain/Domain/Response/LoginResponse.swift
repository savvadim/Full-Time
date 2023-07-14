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
