import Foundation
import Moya
import Alamofire

let userProvider = MoyaProvider<UserApi>()


userProvider.request(.signUp(req: .init(username: "123", password: "123", passwordCheck: "123"))) {
    switch $0 {
    case let .success(result):
        print(result.response ?? "response is nil")
    case let .failure(e):
        print(e)
    }
}

RunLoop.main.run()
