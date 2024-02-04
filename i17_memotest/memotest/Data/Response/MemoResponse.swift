struct MemoResponse: Decodable {
    let createdAt: String
    let memo: String
    let id: String
    
    func toDomain() -> Memo {
        Memo(id: id,
             memo: memo,
             createdAt: createdAt)
    }
}

typealias MemosResponse = [MemoResponse]
