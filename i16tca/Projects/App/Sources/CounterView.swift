//
//  CounterView.swift
//  MyApp
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct CounterState: Equatable {
    var count: Int = 0
}

enum CounterAction {
    case addCount
    case subtract
}

struct CounterEnvironment {
    
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    switch action {
    case .addCount:
        state.count += 1
        return .none
    case .subtract:
        state.count -= 1
        return .none
    }
    
}

struct CounterView: View {
    
    let store: Store<CounterState, CounterAction>
    
    var body: some View {
        WithViewStore(self.store) { vs in
            VStack {
                Text("\(vs.state.count)")
                    .padding()
                Button("+") {
                    vs.send(.addCount)
                }
                Button("-") {
                    vs.send(.subtract)
                }
            }
        }
    }
}
