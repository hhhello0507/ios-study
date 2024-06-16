import Combine

public protocol TodoDataSource {
    func getTodos() -> AnyPublisher<[TodoResponse], APIError>
}
