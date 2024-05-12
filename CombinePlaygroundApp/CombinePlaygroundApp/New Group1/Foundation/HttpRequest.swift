import Foundation
import Alamofire

public struct HttpRequest<Response: Decodable> {
    
    public typealias Parameters = [String: Any]
    
    let url: String
    let method: HTTPMethod
    let parameters: Parameters?
    let response: Response.Type
    let encoder: ParameterEncoder?
    let headers: HTTPHeaders?
    let authorization: Bool
    
    public init(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        response: Response.Type,
        encoder: ParameterEncoder? = nil,
        headers: HTTPHeaders? = nil,
        authorization: Bool = true
    ) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.response = response
        self.encoder = encoder
        self.headers = headers
        self.authorization = authorization
    }
}

public extension HttpRequest.Parameters {
    func toURLQuestItems() -> [URLQueryItem] {
        self.map {
            URLQueryItem(name: $0, value: ($1 as? LosslessStringConvertible)?.description)
        }
    }
}
