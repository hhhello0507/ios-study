//
//  ContentView.swift
//  i09_enum_practice
//
//  Created by dgsw8th71 on 2023/09/11.
//

import SwiftUI

struct ContentView: View {
    @State var langArr: [Language] = []
    @State var isShow = false
    @State var clickedLanguage: Language? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(langArr, id: \.self) { lang in
                        Button(lang.toString()) {
                            clickedLanguage = lang
                            isShow = true
                        }
                    }
                }
                VStack {
                    Spacer()
                    Button("ㄱㄱ") {
                        var tempArr: [Language] = []
                        for _ in 0 ..< 10 {
                            tempArr.append(Language.getRandom())
                        }
                        langArr = tempArr
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Spacer().frame(height: 100)
                }
            }
            .alert(clickedLanguage?.getHelloWorld() ?? "error", isPresented: $isShow) {
                Button("OK", role: .cancel) {
                    
                }
            }
            .navigationTitle("Print!")
        }
        
    }
}

enum Language: CaseIterable {
    case objectC
    case kotlin
    case basic
    case go
    case rust
    
    func getHelloWorld() -> String {
        switch self {
        case .objectC:
            return "NSLog(@\"Hello World\")"
        case .basic:
            return "PRINT \"Hello World\""
        case .go:
            return "fmt.Println(\"Hello World\")"
        case .rust:
            return "println!(\"Hello World\")"
        case .kotlin:
            return "println(\"Hello World\")"
        }
    }
    
    func toString() -> String {
        String(describing: self)
    }
    
    static func getRandom() -> Language {
        let arr: [Language] = Language.allCases
        return arr[Int.random(in: 0 ..< arr.count)]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
