//
//  NewsFeature.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import ComposableArchitecture
import Combine
import Moya
import Foundation
import CombineMoya
import Alamofire

class NewsFeature: BaseFeature, ReducerProtocol {
    
    let newsRepository = NewsRepository.S
    private var cancellables = Set<AnyCancellable>()
    struct State: Equatable {
        var newsList: NewsListModel = []
        var isLoading: Bool = true
    }
    
    struct Failure: Error, Equatable {
        
    }
    
    enum Action: Equatable {
        case newNewsList(NewsListModel)
        case start
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .newNewsList(let newsItems):
            state.newsList = newsItems
            state.isLoading = false
            return .none
        case .start:
            return .none
//            return .init(value: Action.newNewsList(newsRepository.fetchNewsAll()
//                .map{ $0.items }
//                .eraseToEffect()))
//            return Just(.start)
//                .eraseToEffect()
//            return newsRepository.fetchNewsAll()
//                .map { $0.items }
//                .eraseToEffect()
//            return newsRepository.fetchNewsAll()
//                .map { Action.newNewsList($0.items) }
//                .eraseToEffect()
                
//                .map { Action.newNewsList($0.items) }
//                .eraseToEffect()
        }
    }
    
    func a(send: @escaping @Sendable (_ send: Send<Action>) async throws -> Void) {
        
    }
}
