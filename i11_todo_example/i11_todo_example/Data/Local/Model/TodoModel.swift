//
//  TodoModel.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//

import Foundation

struct TodoModel: Hashable {
    var id: Int
    var todo: String
    var createdAt: Date
    var position: Int
}
