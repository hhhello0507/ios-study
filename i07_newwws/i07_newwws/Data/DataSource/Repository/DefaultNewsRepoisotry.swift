//
//  DefaultNewsRepoisotry.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/09.
//

import Foundation
import RxSwift

class DefaultNewsRepository: NewsRepository {
    func fetchNewsAll() -> Single<NewsListModel> {
        return NewsRemote.SF.fetchNewsList()
    }
    
    static var SF: NewsRepository = DefaultNewsRepository()
}
