import Foundation
import Moya
import Combine
import CombineMoya

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

let provider = MoyaProvider<TodoTarget>()

let decoder = JSONDecoder()

class MoyaTodoServiceImpl: TodoDataSource {
    
    
    func getTodos() -> AnyPublisher<[TodoResponse], APIError> {
        provider
            .requestPublisher(.todos(req: .init(email: "", password: "")))
            .filterSuccessfulStatusCodes()
            .tryMap { result in
                guard let value = try? decoder.decode([TodoResponse].self, from: result.data) else {
                    throw APIError.unknown
                }
                return value
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return .unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
