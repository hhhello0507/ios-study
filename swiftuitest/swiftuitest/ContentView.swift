//
//  ContentView.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

class TestEnvironmentObject: ObservableObject {
    @Published var data: [Int] = []
}

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    FirstView()
                } label: {
                    Text("to First View")
                }
            }
            .padding()
        }
    }
}

class FirstViewModel: ObservableObject {
    @Published var count = 0
    @Published var lst: [Int] = []
}

struct FirstView: View {
    
    @ObservedObject var vm = FirstViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            Button {
                vm.count += 1
            } label: {
                Text("count++")
            }
            NavigationLink {
                SecondView()
            } label: {
                Text("to second")
            }
            
            ScrollView {
                VStack {
                    ForEach(vm.lst, id:\.self) {
                        Text("\($0)")
                    }
                }
            }
            Button {
                vm.lst.append(1)
            } label: {
                Text("add 1")
            }
        }
        .onDisappear {
            vm.lst = []
            vm.count = 0
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            
        }
    }
}
