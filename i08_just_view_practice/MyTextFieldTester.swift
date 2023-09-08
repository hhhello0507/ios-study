//
//  MyTextFieldTester.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import SwiftUI

struct MyTextFieldTester: View {
    
    @State var isShown = false
    var body: some View {
        
        ZStack {
            Button("Show Alert") {
                isShown.toggle()
            }
            MyTextFieldAlert(isShown: $isShown)
        }
      
    }
}
