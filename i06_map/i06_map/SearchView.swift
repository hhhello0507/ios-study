//
//  SearchView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import SwiftUI

struct SearchView: View {
    var hint: String
    @State var text: String
    var body: some View {
        HStack {
            TextField(hint, text: $text)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color(uiColor: .white))
                .cornerRadius(5)
            Button("검색") {
                
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.blue)
            .foregroundColor(.white)
            .disabled(text.isEmpty)
            .cornerRadius(5)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(hint: "맛집을 검색해보세요", text: "")
    }
}
