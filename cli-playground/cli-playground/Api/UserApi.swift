import Moya

enum UserApi {
    
    case signUp(req: SignUpRequest)
    case signIn
    case refresh
    
}
