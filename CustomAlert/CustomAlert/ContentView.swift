//
//  ContentView.swift
//  CustomAlert
//
//  Created by hhhello0507 on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var alertProvider: AlertProvider
    @State var show = false
    var body: some View {
        VStack {
            Button("ㄱㄱㄱ") {
                alertProvider.present("WOW 소 ㅅ")
            }
            Button("normal") {
                show = true
            }
        }
        .background(.red)
        .alert("WOW", isPresented: $show) {
            Button("OK") {}
        }
    }
}
