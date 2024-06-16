import Combine

class TodoRepositoryImpl: TodoRepository {
    
    private let todoService: TodoDataSource
    
    init(todoService: TodoDataSource) {
        self.todoService = todoService
    }
    
    func getTodos() -> AnyPublisher<Result<[Todo]>, Never> {
        todoService.getTodos()
            .map { $0.map { $0.toDomain() } }
            .asResult()
    }
}
