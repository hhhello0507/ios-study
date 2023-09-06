//
//  NewView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 1)
            ScrollView {
                VStack {
                    ForEach(0 ..< 10, id: \.self) { i in
                        ListView(title: String(i), content: String(i), image: "blah")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            Spacer().frame(height: 1)
        }
    }
}
