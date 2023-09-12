//
//  BaseRemote.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import Moya
import Alamofire
import Combine
import CombineMoya
import Moya
import ComposableArchitecture

class BaseRemote<API: Gong0Api> {
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    
    init() {
        self.provider = MoyaProvider<API>(plugins: [Logger()])
    }
    public func request<T: Decodable>(_ api: API, dto: T.Type) -> Effect<T> {
        return requestPublisher(api)
            .map(\.data)
            .decode(type: dto, decoder: decoder)
    }

    public func request(_ api: API) -> Future<Response, Error> {
        requestPublisher(api)
    }
    
    
    private func requestPublisher(_ api: API) -> Future<Response, Error> {
        return self.defaultRequest(api)
     }
}

private extension BaseRemote {
    func defaultRequest(_ api: API) -> Future<Response, Error> {

        return Future<Response, Error> { [weak self] promise in
            guard let self = self else { return }
                        self.provider.request(api) { result in
                            switch result {
                            case let .success(response):
                                promise(.success(response))
                            case let .failure(error):
                                promise(.failure(error))
                            }
                        }
            
        }
    }
}
