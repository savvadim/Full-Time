//
//  APIModel.swift
//  Networking
//
//  Created by Vladislav Skuratov on 10.12.2022.
//

import Foundation

public protocol APIModel {
    static func customeDecode(from data: Data) -> Self?
}

public typealias APIModelCodable = APIModel & Codable

extension APIModel where Self: APIModelCodable {
    public static func from(data: Data) throws -> Self {
        let decoder = JSONDecoder()

        return try decoder.decode(Self.self, from: data)
    }

    public static func from(dictionary: [String: Any]) throws -> Self {
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        return try from(data: jsonData)
    }

    public static func customeDecode(from data: Data) -> Self? { return nil }
}

extension Array: APIModel where Element: APIModelCodable {
    public static func from(object: Any?) -> [Element]? {
        guard let object = object else { return nil }
        if let jsonData = try? JSONSerialization.data(withJSONObject: object) {
            return try? [Element].from(data: jsonData)
        }

        return nil
    }
}

extension Encodable {
    public func dictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            else {
                throw NSError()
        }

        return dictionary
    }
}

