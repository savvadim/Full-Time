//
//  NetworkProvider.swift
//  Networking
//
//  Created by Vladislav Skuratov on 09.12.2022.
//

import Foundation
import Moya

open class NetworkProvider: ServiceProtocol {
    // MARK: Private properties
    private var tasks = [Moya.Cancellable]()

    deinit {
        tasks.forEach { $0.cancel() }
    }

    public func request<T: APIModelCodable>(_ target: APIService,
                                     completion: @escaping ((APIResult<T>) -> Void)) {
        let task = apiProvider.request(target) { [weak self] in
            self?.handle(target: target, result: $0, completion: completion)
        }

        tasks.append(task)
    }

    public init() { }
}

public protocol ServiceProtocol { }

extension ServiceProtocol where Self: NetworkProvider {
    public func handle<T: APIModelCodable>(
        target: APIService,
        result: Result<Moya.Response, Moya.MoyaError>,
        completion: @escaping ((APIResult<T>) -> Void)) {
        switch result {
        case let .success(moyaResponse):
            let data = moyaResponse.data
            do {
                let decodedJson = try T.from(data: data)

                print(" ✅ \(String(describing: moyaResponse.request))")
                return completion(.success(decodedJson))
            } catch {
                if let customeDecoded = T.customeDecode(from: data) {
                    print(" ✅ \(String(describing: moyaResponse.request))")
                    return completion(.success(customeDecoded))
                }

                print(" 🛑🛑🛑 \(String(describing: moyaResponse.request)) \n \(error)")
                completion(.error(AppError.data(error, moyaResponse.statusCode)))
            }

            let response = (try? moyaResponse.mapString()) ?? ""

            print(response)

        case let .failure(error):
            print(" 🛑🛑🛑 \(error)")

            completion(.error(AppError.network(error)))
        }
    }
}
