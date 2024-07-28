//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by hhhello0507 on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var a: A
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("S") {}
        }
        .padding()
        .onAppear {
            print(a)
        }
    }
}

#Preview {
    ContentView()
}
