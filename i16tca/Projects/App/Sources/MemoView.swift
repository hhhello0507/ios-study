//
//  MemoView.swift
//  MyApp
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct MemoState: Equatable {
    var memos: Memos = []
    var isLoading = false
}

enum MemoAction {
    case fetchAll
    case itemsResponse(Result<Memos, MemoClient.Failure>)
    
}

struct MemoEnvironment {
    var memoClient: MemoClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let memoReducer = Reducer<MemoState, MemoAction, MemoEnvironment> { state, action, environment in
    switch action {
    case .fetchAll:
        enum ItemId {}
        state.isLoading = true
        return environment.memoClient
            .fetchMemos()
            .debounce(id: ItemId.self,
                      for: 0.5,
                      scheduler: environment.mainQueue)
            .mapError { _ in MemoClient.Failure() }
            .catchToEffect(MemoAction.itemsResponse)
    case .itemsResponse(.success(let memos)):
        state.isLoading = false
        state.memos = memos
        return .none
    case .itemsResponse(.failure(let e)):
        state.isLoading = false
        return .none
    }
}

struct MemoView: View {
    
    var store: Store<MemoState, MemoAction>
    
    var body: some View {
        WithViewStore(self.store) { vs in
            List {
                Section(header:
                            VStack {
                    Button {
                        vs.send(.fetchAll)
                    } label: {
                        Text("ㄱㄱ")
                    }
                }, content: {
                    ForEach(vs.state.memos) { i in
                        Text(i.memo)
                    }
                })
            }
        }
    }
}
