//
//  TextFieldTest.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 3/22/24.
//

import SwiftUI

struct TextFieldTest: View {
    @State var t1 = ""
    @State var t2 = ""
    
    var body: some View {
        VStack {
            ZStack {
                TextField("1", text: $t1)
                TextField("2", text: $t2)
            }
            Text("t1 - \(t1)")
            Text("t2 - \(t2)")
        }
    }
}
