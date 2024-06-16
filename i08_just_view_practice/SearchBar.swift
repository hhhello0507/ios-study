//
//  SearchBar.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import SwiftUI
struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack {
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)
                    TextField("Search", text: $text)
                        .frame(width: 320, height:40)
                }
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .foregroundColor(.gray)
                .padding(.horizontal, 24)
                
                TextField("Search", text: $text)
                    .padding(8)
                    .padding(.leading, 24)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        }
                    )
            }
           
        }
        .padding(.horizontal, 10)
    }
}

struct SearchBar_Preview: PreviewProvider {
    @State static var searchText: String = ""
    static var previews: some View {
        SearchBar(text: $searchText)
    }
}
