//
//  Memo.swift
//  MyApp
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
struct Memo: Codable, Equatable, Identifiable {
    let createdAt, memo, id: String
}

typealias Memos = [Memo]
