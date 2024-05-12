import Combine

public protocol TodoRepository {
    func getTodos() -> AnyPublisher<Result<[Todo]>, Never>
    func createTodo(content: String) -> AnyPublisher<Result<Void>, Never>
}
