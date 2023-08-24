//
//  Views.swift
//  crud
//
//  Created by dgsw8th71 on 2023/08/18.
//

import SwiftUI

struct MyPrettyText: View {
    var text: String
    var body: some View {
        Text(text)
            .padding(10)
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}
struct MyPrettyButton: View {
    var text: String
    var callback: () -> Void
    var body: some View {
        Button(text) {
            callback()
        }
            .padding(10)
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct MyLabel: View {
    let text: String
    var isCenter: Bool = false
    var body: some View {
        HStack {
            if isCenter {
                Spacer()
            }
            Text(text)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .padding(.leading, 10)
            Spacer()
        }
    }
}

struct MyTextField: View {
    let hint: String
    var text: Binding<String>
    var body: some View {
        HStack {
            Spacer()
            TextField(hint, text: text)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            Spacer()
        }
    }
}
