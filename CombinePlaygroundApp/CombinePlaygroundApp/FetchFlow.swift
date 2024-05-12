enum FetchFlow<T: Equatable>: Equatable {
    case success(_ data: T)
    case failure
    case fetching
}

public struct VoidFetchFlow: Equatable {
    private init() {}
    public static let none = VoidFetchFlow()
}
