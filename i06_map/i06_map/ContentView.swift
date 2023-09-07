//
//  ContentView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                FindView()
                    .tabItem {
                        Label("탐색", systemImage: "location.circle.fill")
                    }
                CommunityView()
                    .tabItem {
                        Label("커뮤니티", systemImage: "ellipsis.message.fill")
                    }
                    .badge("!")
            }
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
