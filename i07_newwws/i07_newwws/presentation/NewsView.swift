//
//  NewView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var vm: NewsViewModel = NewsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                Text("loading...")
            }
            VStack {
                Spacer().frame(height: 1)
                ScrollView {
                    VStack {
                        ForEach(vm.news ?? [], id: \.self) { i in
                            NavigationLink(value: i.news_url) {
                                ListView(title: i.title, content: i.content.substring(from: 0, to: 100) + "...", image: i.thum_url)
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
        
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유:
        return String(self[startIndex ..< endIndex])
    }
}
