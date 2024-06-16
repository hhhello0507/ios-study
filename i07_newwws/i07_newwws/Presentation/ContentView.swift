//
//  ContentView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                NewsView(st: Store(initialState: NewsFeature.State()) {
                    NewsFeature()
                })
                    .tabItem {
                        Label("뉴스", systemImage: "newspaper.fill")
                    }
                    .tag(0)
                WeatherView()
                    .tabItem {
                        Label("날씨", systemImage: "sun.min.fill")
                    }
                    .tag(1)
            }
            .navigationTitle(tabTitle(for: selectedTab))
        }
    }
    private func tabTitle(for tab: Int) -> String {
            switch tab {
            case 0: return "뉴스"
            case 1: return "날씨"
            default:
                return "알 수 없음"
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
