//
//  TodoUpdateRequest.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//

import Foundation
struct TodoUpdateRequest: Encodable {
    let id: Int
    let todo: String
}
