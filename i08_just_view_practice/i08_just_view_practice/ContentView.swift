//
//  ContentView.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import SwiftUI

struct ContentView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack {
            MySheetAndFullScreenCover()
//            SearchBar(text: $searchText)
//            MyTextFieldTester()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
