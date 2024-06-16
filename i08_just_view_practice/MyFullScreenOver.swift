//
//  MyFullScreenOver.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import SwiftUI
struct MyFullScreenCover: View {
    
    @Binding var isShownFullScreenCover: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.isShownFullScreenCover.toggle()
                } label: {
                    Text("cancel")
                }
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
            Text("Full Screen Cover")
            Spacer()
        }
    }
}
