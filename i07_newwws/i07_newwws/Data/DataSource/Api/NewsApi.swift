//
//  ClubApi.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import Moya

enum NewsApi {
    case newsList
}

extension NewsApi: Gong0Api {
    var errorMap: [Int : ErrorType] {
        return [200: .dum]
    }
    
    typealias ErrorType = DummyError
    
    var domain: Gong0Domain {
        return .news
    }

    var urlPath: String {
        switch self {
        case .newsList:
            return "B551024/openArirangNewsApi/news"
        }
    }

    var method: Moya.Method {
        switch self {
        case .newsList:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .newsList:
            return .requestParameters(parameters: [
                "serviceKey":"RHhhles6nt29M2pFL/neTLyr/dSDqd8r1B+Tre1yfaBNlSBoxg++9+QxBlrMd05mKWZzgIWqIOUYdU0a/1GLhA==",
                "pageNo":1,
                "numOfRows":10
            ], encoding: URLEncoding.queryString)
        }
    }

    var errorMapper: [Int: Gong0Error]? {
        switch self {
        case .newsList:
            return [
                400: .invalidInput,
                401: .unauthorized,
                500: .serverError
            ]
        }
    }
}
