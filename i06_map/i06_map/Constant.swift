//
//  Constant.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct Constant {
    static let BASE_URL = "http://127.0.0.1:8080"
}

extension URL {
    static func getBoardList() -> URL? {
        return URL(string: "\(Constant.BASE_URL)/boards")
    }
    
    static func uploadBoard() -> URL? {
        return URL(string: "\(Constant.BASE_URL)/board")
    }
}
