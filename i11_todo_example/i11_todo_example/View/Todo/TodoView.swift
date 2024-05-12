//
//  TodoView.swift
//  i11_todo_example
//
//  Created by dgsw8th71 on 2023/09/22.
//

import Foundation
import SwiftUI

struct TodoView: View {
    let todo: String
    let createdAt: Date

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo)
                    .font(.title)
                Text(Self.dateFormatter.string(from: createdAt))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(5)
        .padding(.horizontal, 8)
        
    }
}

extension TodoView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
