//
//  swiftuitestApp.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI
import Alamofire

@main
struct swiftuitestApp: App {
    
    @State private var colorSet = ColorSet()
    
    var body: some Scene {
        WindowGroup {
            Text("Hello World")
                .task {
                    let response = AF.request("https://koreanjson.com/users")
                        .responseJSON {
                            print($0)
                        }
                }
        }
    }
}
