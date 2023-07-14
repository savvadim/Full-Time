//
//  APIResult.swift
//  Networking
//
//  Created by Vladislav Skuratov on 10.12.2022.
//

import Foundation

public enum APIResult<T> {
    case success(T)
    case error(AppError)
}
