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
    public func request<T: Decodable>(_ api: API, dto: T.Type) -> AnyPublisher<T, Error> {
        return requestPublisher(api)
            .map(\.data)
            .decode(type: dto, decoder: decoder)
            .eraseToAnyPublisher()
    }

    public func request(_ api: API) -> AnyPublisher<Void, Error> {
        requestPublisher(api)
            .map { _ in return }
            .eraseToAnyPublisher()
    }
    private func requestPublisher(_ api: API) -> AnyPublisher<Response, Error> {
        return self.defaultRequest(api)
     }
}

private extension BaseRemote {
    func defaultRequest(_ api: API) -> AnyPublisher<Response, Error> {
        return self.provider.requestPublisher(api, callbackQueue: .main)
            .mapError { api.errorMap[$0.response?.statusCode ?? 0] ?? $0 as Error }
            .eraseToAnyPublisher()
    }
}
