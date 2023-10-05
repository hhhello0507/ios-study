//
//  TodoViewModel.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var dummyLst = [
        TodoModel(id: 0, todo: "취업하기", createdAt: Date(), position: 2),
        TodoModel(id: 1, todo: "돈벌기", createdAt: Date(), position: 0),
        TodoModel(id: 2, todo: "놀기", createdAt: Date(), position: 1),
        TodoModel(id: 3, todo: "공부하기", createdAt: Date(), position: 3)
    ]
    
    func createTodo() {
        // ...
    }
    
    func updateTodo() {
        // ...
    }
    
    func deleteTodo() {
        // ..
    }
}


