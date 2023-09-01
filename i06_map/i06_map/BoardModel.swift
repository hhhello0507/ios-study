//
//  BoardResponse.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import Foundation

struct BoardModel: Decodable, Hashable {
    let id: Int
    let title: String
    let content: String
    let createdTime: Int
    let author: Int
}
