import Alamofire

final class MemoService {
    func getTodos() async throws -> Memos {
        try await AF.request("\(baseUrl)/memo/get",
                             method: .get).serializingDecodable(MemosResponse.self).value.map { $0.toDomain() }
    }
    
    func postTodos(_ request: MemoCreateRequest) async throws -> Memo {
        try await AF.request("\(baseUrl)/memo/get",
                             method: .post,
                             parameters: request).serializingDecodable(MemoResponse.self).value.toDomain()
    }
}

extension MemoService {
    public static let live = MemoService()
}
