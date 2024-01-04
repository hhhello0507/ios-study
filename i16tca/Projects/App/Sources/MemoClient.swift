//
//  MemoClient.swift
//  MyApp
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Alamofire

struct MemoClient {
    var fetchMemos: () -> Effect<Memos, Failure>
    
    struct Failure: Error, Equatable {}
}

extension MemoClient {
    static let live = Self(
        fetchMemos: {
            Effect.task {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://6596aabe6bb4ec36ca031e19.mockapi.io/api/v1/todo/get")!)
                return try JSONDecoder().decode(Memos.self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }
    )
}
