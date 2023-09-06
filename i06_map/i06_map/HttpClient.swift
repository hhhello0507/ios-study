//
//  HttpClient.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import Foundation

class HttpClient {
    func getBoardList(completion: @escaping (Result<[BoardModel], NetWorkError>) -> Void) {
        guard let url = URL.getBoardList() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let boardList = try? JSONDecoder().decode([BoardModel].self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(boardList))
            
        }.resume()
    }
    
}
