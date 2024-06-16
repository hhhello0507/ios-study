import Alamofire
import Combine
import Foundation

public enum APIError: Error {
    case http(ErrorResponse)
    case unknown
}

public enum APIClient {
    private static let agent = APIAgent()
    private static let baseURL = "http://10.80.161.24:3000"
    
    public static func request<R: Encodable, T: Decodable>(
        _ request: HttpRequest<T>,
        body: R? = VoidRequest()
    ) -> AnyPublisher<T, APIError> {
        var url = URL(string: baseURL)?.appending(path: request.url)
        
        if let parameters = request.parameters {
            url = url?.appending(queryItems: parameters.toURLQuestItems())
        }
        let body = body is VoidRequest ? nil : body
        let encoder: ParameterEncoder = request.method == .get ? URLEncodedFormParameterEncoder.default : JSONParameterEncoder.default
        let request = AF.request(
            url!,
            method: request.method,
            parameters: body,
            encoder: request.encoder != nil ? request.encoder! : encoder,
            headers: request.headers
        )
        
        return agent.run(request)
    }
}

public struct VoidRequest: Encodable {
    public init() {}
}

extension Encodable {
    func asParameters() throws -> Parameters? {
        let data = try JSONEncoder().encode(self)
        let params = try JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments) as? Parameters
        return params
    }
}
