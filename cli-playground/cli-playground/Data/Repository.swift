import Combine

enum Repository {
    static func requestGet() -> AnyPublisher<Result<HelloResponse>, Never> {
        APIClient.request(.init(url: "hello", method: .get, response: HelloResponse.self))
            .asResult()
    }
    
    static func requestPost(req: Create) -> AnyPublisher<Result<VoidResponse>, Never> {
        APIClient.request(.init(url: "create", method: .post, parameters: ["id": 1, "page" : 1], response: VoidResponse.self), body: req)
            .asResult()
    }
}
