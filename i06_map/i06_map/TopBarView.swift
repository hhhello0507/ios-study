//
//  TopBarView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import SwiftUI

struct TopBarView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack {
            HStack {
                SearchView(hint: "맛집을 검색해보세요", text: searchText)
            }
            Spacer()
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
