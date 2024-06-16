import Combine

public protocol TodoRepository {
    func getTodos() -> AnyPublisher<Result<[Todo]>, Never>
}
