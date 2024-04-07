//
//  swiftuitestApp.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI
import Alamofire

enum ViewType {
    case A
}

@main
struct SwiftuitestApp: App {
    
    @State var views = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $views) {
                Button {
                    views.append(ViewType.A)
                } label: {
                    Text("Start")
                }
                .navigationDestination(for: ViewType.self) {
                    switch $0 {
                    case .A: A(path: $views)
                    }
                }
            }
        }
    }
}

enum ViewType2 {
    case B, C
}

struct A: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("A")
            HStack {
                Button {
                    path.append(ViewType2.B)
                } label: {
                    Text("B")
                }
                Button {
                    path.append(ViewType2.C)
                } label: {
                    Text("C")
                }
            }
        }
        .navigationDestination(for: ViewType2.self) {
            switch $0 {
            case .B: B()
            case .C: C()
            }
        }
    }
}


struct B: View {
    
    var body: some View {
        Text("B")
    }
}


struct C: View {
    
    var body: some View {
        Text("C")
    }
}
