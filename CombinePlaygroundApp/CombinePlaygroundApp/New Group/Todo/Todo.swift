public struct Todo: Equatable {
    public let id: Int
    public let content: String
    public let createdAt: String
    
    public init(id: Int, content: String, createdAt: String) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}
