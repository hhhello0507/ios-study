import Foundation
import Combine
import SwiftUI

enum FetchCreateTodo {
    case idle
    case fetching
}

public final class TodoViewModel: BaseViewModel {
    
    // MARK: - States
    @Published var todos: FetchFlow<[Todo]> = .fetching
    @Published var filteredTodos: [Todo] = []
    @Published var fetchCreateTodo: FetchCreateTodo = .idle
    @Published var todo = ""
    @Published var fetchTodosFailure = false
    @Published var searchText = ""
    
    private let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
        super.init()
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { _ in
                self.performSearch()
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - Methods
    func fetchTodos() {
        todoRepository.getTodos()
            .sink {
                switch $0 {
                case .success(let todos):
                    self.todos = .success(todos)
                case .failure:
                    self.todos = .failure
                case .fetching:
                    self.todos = .fetching
                }
            }
            .store(in: &subscriptions)
    }
    
    func createTodo() {
        todoRepository.createTodo(content: todo)
            .sink { [self] result in
                switch result {
                case .success:
                    fetchTodos()
                    todo = ""
                    fetchCreateTodo = .idle
                case .failure:
                    fetchTodosFailure = true
                case .fetching:
                    fetchCreateTodo = .fetching
                }
            }
            .store(in: &subscriptions)
    }
    
    private func performSearch() {
        guard case .success(let todos) = todos else {
            return
        }
        filteredTodos = todos.filter { $0.content.contains(searchText) }
    }
}
