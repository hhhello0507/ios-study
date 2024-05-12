//
//  TodoViewModel.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var dummyLst = [
        Todo(id: 0, todo: "취업하기", createdAt: .now, position: 2),
        Todo(id: 1, todo: "돈벌기", createdAt: .now, position: 0),
        Todo(id: 2, todo: "놀기", createdAt: .now, position: 1),
        Todo(id: 3, todo: "공부하기", createdAt: .now, position: 3)
    ]
    
    func createTodo() {
        
    }
    
    func updateTodo() {
        // ...
    }
    
    func deleteTodo() {
        // ..
    }
}


