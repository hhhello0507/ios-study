import Combine

class TodoServiceImpl: TodoDataSource {
    func getTodos() -> AnyPublisher<[TodoResponse], APIError> {
        APIClient.request(.init(url: "todos", method: .get, response: BaseResponse<[TodoResponse]>.self))
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
    func createTodo(content: String) -> AnyPublisher<Void, APIError> {
        APIClient.request(.init(url: "todos", method: .post, response: BaseVoidResponse.self), body: CreateTodoRequest(content: content))
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
