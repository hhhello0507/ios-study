//
//  ClubRemote.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import Combine

class NewsRemote: BaseRemote<NewsApi> {
    func fetchNewsList() -> AnyPublisher<NewsModel, Error> {
        return request(.newsList, dto: NewsModel.self)
    }
}

extension NewsRemote {
    static let S = NewsRemote()
}
