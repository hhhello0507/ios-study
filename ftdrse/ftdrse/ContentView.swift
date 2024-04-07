//
//  ContentView.swift
//  ftdrse
//
//  Created by dgsw8th71 on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                HStack {
                    Text("이강현 바보 멍청이")
                        .foregroundStyle(Color.red)
                    Text("안녕하세요 바보 멍청이 개발자 이강현입니다.")
                        .padding(50)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
