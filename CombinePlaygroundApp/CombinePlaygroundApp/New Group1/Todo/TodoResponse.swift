public struct TodoResponse: Decodable {
    let id: Int
    let content: String
    let createdAt: String
    
    func toDomain() -> Todo {
        Todo(
            id: id,
            content: content,
            createdAt: createdAt
        )
    }
}
