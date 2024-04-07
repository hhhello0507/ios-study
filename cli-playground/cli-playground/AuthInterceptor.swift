//
//  AuthInterceptor.swift
//  cli-playground
//
//  Created by dgsw8th71 on 3/25/24.
//

import Alamofire
import Foundation

public final class AuthInterceptor: RequestInterceptor {

    private let maxRetryCount: Int = 3
    
    public init() {}

    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        completion(.success(urlRequest))
    }

    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("retry 진입")
        let url = request.request?.url?.absoluteURL.absoluteString ?? ""
        print(url)
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401
        else {
            completion(.doNotRetryWithError(error))
            return
        }
        completion(.doNotRetry)
    }
}
