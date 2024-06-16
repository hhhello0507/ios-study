//
//  BaseApi.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import Moya
enum DummyError: LocalizedError {
    case dum
}

protocol Gong0Api: TargetType {
    associatedtype ErrorType: Error
    var domain: Gong0Domain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}
let BASE_URL = "http://apis.data.go.kr"

extension Gong0Api {
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    var path: String {
        return domain.url + urlPath
    }
    var validationType: ValidationType {
        return .successCodes
    }
    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}


enum Gong0Domain: String {
    case news = ""
}

extension Gong0Domain {
    var url: String {
        return "/\(self.rawValue)"
    }
}
