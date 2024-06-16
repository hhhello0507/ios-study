//
//  BaseFeature.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/10.
//

import Foundation
import Combine
import Moya

class BaseFeature {
    public var bag = Set<AnyCancellable>()
    
    public func addCancellable<T>(
        _ publisher: AnyPublisher<T, Error>,
        onReceiveValue: @escaping (T) -> Void,
        onReceiveError: ((Error) -> Void)? = nil
    ) {
        publisher
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    if let onReceiveError {
                        onReceiveError(error)
                    }
                }
            }, receiveValue: onReceiveValue)
            .store(in: &bag)
    }
    
}
