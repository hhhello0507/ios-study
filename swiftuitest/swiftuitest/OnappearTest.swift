//
//  OnappearTest.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 3/5/24.
//

import SwiftUI

struct Onappear1Test: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Onappear2Test()
            } label: {
                Text("hello~")
                    .onAppear {
                        print("Hello~!!hi!!")
                    }
            }
        }
    }
}

struct Onappear2Test: View {
    var body: some View {
        Text("hi")
    }
}
