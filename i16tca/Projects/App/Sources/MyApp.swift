//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyApp: App {
    
    let counterStore = Store(initialState: CounterState(),
                               reducer: counterReducer,
                               environment: CounterEnvironment())
    
    let memoStore = Store(initialState: MemoState(),
                          reducer: memoReducer,
                          environment: MemoEnvironment(memoClient: MemoClient.live,
                                                       mainQueue: .main))
    
    var body: some Scene {
        WindowGroup {
            MemoView(store: memoStore)
//            CounterView(store: counterStore)
        }
    }
}
