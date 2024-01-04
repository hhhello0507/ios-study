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
    
    var body: some Scene {
        WindowGroup {
            
            CounterView(store: counterStore)
        }
    }
}
