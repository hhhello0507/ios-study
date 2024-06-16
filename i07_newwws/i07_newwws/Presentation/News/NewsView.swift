//
//  NewView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import SwiftUI
import ComposableArchitecture

struct NewsView: View {
    let st: StoreOf<NewsFeature>
    
    init(st: StoreOf<NewsFeature>) {
        self.st = st
        st.send(.start)
    }
    
    var body: some View {
        WithViewStore(self.st, observe: { $0 }) { vs in
            ZStack {
                if vs.isLoading {
                    Text("loading...")
                }
                VStack {
                    Spacer().frame(height: 1)
                    ScrollView {
                        VStack {
                            ForEach(vs.newsList, id: \.self) { i in
                                NavigationLink(value: i.news_url) {
                                    NewsItemView(title: i.title, content: i.content.substring(from: 0, to: 100) + "...", image: i.thum_url)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                }
                                .navigationDestination(for: String.self) { string in
                                    NewsDetialView(url: string)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer().frame(height: 1)
                }
            }
            .background(Color(.secondarySystemBackground))
        }
    }
}
