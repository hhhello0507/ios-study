import Foundation
import Moya

enum TodoTarget: TargetType {
    
    case todos(req: LoginReq)
}

extension TodoTarget {
    
    var baseURL: URL {
        URL(string: "https://hoolc.me")!
    }
    
    var path: String {
        switch self {
        case .todos: "member/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .todos: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .todos(let req): .requestJSONEncodable(req)
        }
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}
