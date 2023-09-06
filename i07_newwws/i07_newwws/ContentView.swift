//
//  ContentView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NewsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
