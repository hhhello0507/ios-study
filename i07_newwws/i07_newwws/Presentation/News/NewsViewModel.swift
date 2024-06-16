//
//  NewsViewModel.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import Alamofire
import Foundation

extension NewsView {
    class NewsViewModel: ObservableObject {
        
        @Published var news: [NewsModeldeldel]?
        @Published var isLoading: Bool = true
        
        init() {
            fetch()
        }
        
        func fetch() {
            let params = [
                "serviceKey":"RHhhles6nt29M2pFL/neTLyr/dSDqd8r1B+Tre1yfaBNlSBoxg++9+QxBlrMd05mKWZzgIWqIOUYdU0a/1GLhA==",
                "pageNo":"1",
                "numOfRows":"10"
            ]
            AF.request("http://apis.data.go.kr/B551024/openArirangNewsApi/news",
                       method: .get,
                       parameters: params).responseData { res in
                
                switch res.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(NewsModel.self, from: data)
                        self.news = result.items
                        self.isLoading = false
                    } catch {
                        
                    }
                case let .failure(e):
                    print(e)
                }
            }
        }
    }
}
