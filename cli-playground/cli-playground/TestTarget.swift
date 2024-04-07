//
//  TestTarget.swift
//  cli-playground
//
//  Created by dgsw8th71 on 3/25/24.
//

import Foundation
import Moya

enum TestTarget: TargetType {
    case test(statusCode: Int)
}

extension TestTarget {
    
    var baseURL: URL {
        URL(string: "http://10.80.161.253:8081")!
    }
    
    var path: String {
        switch self {
        case .test(let code):
            "/test/\(code)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .test:
                .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .test:
                .requestPlain
        }
    }
    
    var headers: [String : String]? { nil }
    
    var validationType: ValidationType {
        .successCodes
    }
    
}
