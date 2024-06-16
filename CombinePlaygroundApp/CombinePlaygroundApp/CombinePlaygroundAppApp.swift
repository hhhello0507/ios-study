//
//  CombinePlaygroundAppApp.swift
//  CombinePlaygroundApp
//
//  Created by dgsw8th71 on 5/12/24.
//

import SwiftUI

@main
struct CombinePlaygroundAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TodoView(
                    viewModel: TodoViewModel(
                        todoRepository: TodoRepositoryImpl(
                            todoService: MoyaTodoServiceImpl()
                        )
                    )
                )
            }
        }
    }
}
