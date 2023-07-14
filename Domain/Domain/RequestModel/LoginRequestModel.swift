//
//  LoginRequestModel.swift
//  Domain
//
//  Created by Vladislav Skuratov on 10.12.2022.
//

import Foundation
import Networking

public struct LoginRequestModel: APIModelCodable {
    private let login: String
    private let password: String

    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
