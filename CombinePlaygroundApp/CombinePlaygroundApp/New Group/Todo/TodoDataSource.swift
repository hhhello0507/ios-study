import Combine

public protocol TodoDataSource {
    func getTodos() -> AnyPublisher<[TodoResponse], APIError>
    func createTodo(content: String) -> AnyPublisher<Void, APIError>
}
