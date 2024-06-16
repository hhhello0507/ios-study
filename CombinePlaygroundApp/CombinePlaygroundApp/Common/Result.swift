import Combine

public enum Result<Success> {
    case success(_ data: Success)
    case failure(error: Error)
    case fetching
}

public extension Publisher {
    func asResult() -> AnyPublisher<Result<Output>, Never> {
        return map { Result.success($0) }
            .prepend(Result.fetching)
            .catch { error in
                Just(Result.failure(error: error))
            }
            .eraseToAnyPublisher()
    }
}
