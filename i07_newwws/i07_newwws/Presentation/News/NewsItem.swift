//
//  ListView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import SwiftUI

struct NewsItemView: View {
    let title: String
    let content: String
    let image: String
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray
                    .cornerRadius(5)
            }
            .aspectRatio(16/9, contentMode: .fill)
            .cornerRadius(5)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Text(content)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
    }
}


struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        NewsItemView(title: "test", content: "test", image: "blah")
    }
}
