import Foundation
import Alamofire
import Combine

public struct APIAgent {
    public func run<T: Decodable>(
        _ request: DataRequest,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<T, APIError> {
        return request
            .validate()
            .publishData()
            .tryMap { result in
                if let error = result.error {
                    if let errorData = result.data {
                        let value = try decoder.decode(ErrorResponse.self, from: errorData)
                        throw APIError.http(value)
                    } else {
                        throw error
                    }
                }
                guard let data = request.data else {
                    throw APIError.unknown
                }
                let value = try decoder.decode(T.self, from: data)
                return value
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return .unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
