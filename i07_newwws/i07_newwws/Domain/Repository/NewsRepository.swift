//
//  NewsRepository.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import Combine

class NewsRepository {
    private let newsRemote = NewsRemote.S
    func fetchNewsAll() -> AnyPublisher<NewsModel, Error> {
        return self.newsRemote.fetchNewsList()
    }
}

extension NewsRepository {
    static let S = NewsRepository()
}
