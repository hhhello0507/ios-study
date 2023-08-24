//
//  ContentView.swift
//  yeah
//
//  Created by dgsw8th71 on 2023/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Nav2Screen()
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

enum Nav_Route: String {
    case Nav1
    case Nav2
    case Nav3
}

struct NavigationTestView: View {
    var body: some View {
        NavigationView {
            NavigationStack {
                List {
                    NavigationLink(Nav_Route.Nav1.rawValue) {
                        Nav1Screen()
                    }
        //            .navigationTitle(Nav_Route.Nav1.rawValue)
                    NavigationLink(Nav_Route.Nav2.rawValue) {
                        Nav2Screen()
                    }
                }.navigationTitle("NavList")
            }
        }
    }
}

struct Nav1Screen: View {
    @State var text: String = ""
    
    var body: some View {
        VStack {
            MyLabel(text: "TextField1")
            MyTextField(text: text, hint: "Enter anything")
            
            MyLabel(text: "TextField2")
            MyTextField(text: text, hint: "Enter anything")
            
            MyLabel(text: "TextField3")
            MyTextField(text: text, hint: "Enter anything")
            Spacer()
            Button("Hello") {
                
            }
            .padding(7.5)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            Spacer()
        }
    }
}

struct MyLabel: View {
    var text: String = ""
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.leading, 30)
            Spacer()
        }
    }
}

struct MyTextField: View {
    @State var text: String = ""
    var hint: String = ""
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 5)
            TextField(hint, text: $text)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
            Spacer()
                .frame(width: 10)
        }
    }
}

struct Nav2Screen: View {
    var body: some View {
        HStack {
            Text("World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTestView()
    }
}


