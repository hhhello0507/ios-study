//
//  TodoResponse.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//
import Foundation

struct TodoResponse: Decodable {
    var id: Int
    var todo: String
    var createdAt: Date
}
