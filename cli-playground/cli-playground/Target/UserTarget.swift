import Moya
import Foundation

extension UserApi: TargetType {
    var baseURL: URL {
        URL(string: "http://localhost:8080/api/v1/users")!
    }
    
    var path: String {
        switch self {
        case .signUp: "sign-up"
        case .signIn: "sign-in"
        case .refresh: "refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp: .post
        case .signIn: .post
        case .refresh: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let req):
                .requestJSONEncodable(req)
        case .signIn: .requestPlain
        case .refresh: .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
