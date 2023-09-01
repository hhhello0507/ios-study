//
//  ContentView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        ZStack {
            MapView()
            TopBarView()
                .zIndex(1)
                .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

