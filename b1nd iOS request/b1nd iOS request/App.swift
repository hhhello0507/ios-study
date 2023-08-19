//
//  App.swift
//  b1nd iOS request
//
//  Created by dgsw8th71 on 2023/08/19.
//

import SwiftUI

struct B1ndApp: View {
    @State var isJoin = false
    var body: some View {
        NavigationView {
            if isJoin {
                NavigationLink(destination: DiaryScreen(), isActive: $isJoin) {
                    EmptyView()
                }
            } else {
                OnBoardView(isJoin: $isJoin)
            }
        }
    }
}
