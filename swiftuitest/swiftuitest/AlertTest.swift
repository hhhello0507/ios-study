//
//  AlertTest.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 2/26/24.
//

import SwiftUI

struct AlertTest: View {
    
    @State var dialog = false
    @State var dialogType = Dialog.one
    
    enum Dialog {
        case one, two, three
    }
    
    var body: some View {
        VStack {
            Button {
                dialog = true
                dialogType = .one
            } label: {
                Text("Alert1")
            }
            Button {
                dialog = true
                dialogType = .two
            } label: {
                Text("Alert2")
            }
            Button {
                dialog = true
                dialogType = .three
            } label: {
                Text("Alert3")
            }
        }
        .alert(isPresented: $dialog) {
            switch dialogType {
            case .one:
                Alert(title: Text("alert1"))
            case .two:
                Alert(title: Text("alert2"))
            case .three:
                Alert(title: Text("alert3"))
            }
        }
    }
}
