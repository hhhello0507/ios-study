//
//  TodoListView.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//


import SwiftUI



struct TodoListView: View {
    @ObservedObject var viewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.dummyLst, id: \.id) { todo in
                    TodoView(todo: todo.todo, createdAt: todo.createdAt)
                }
            }
            .navigationTitle("Todo")
        }
    }
}


struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
