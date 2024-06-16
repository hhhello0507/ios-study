//
//  ButtonClickTest.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 2/27/24.
//

import SwiftUI

struct ButtonClickTest: View {
    var callback: () -> Void
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text("Hello")
                .font(.body)
                .frame(maxWidth: .infinity, maxHeight: 54)
        }
        .padding(.horizontal, 20)
    }
}
