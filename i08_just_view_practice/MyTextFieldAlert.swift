//
//  MyTextFieldAlert.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import SwiftUI
struct MyTextFieldAlert: View {
    
    @Binding var isShown: Bool
    @State var text = "Initial Text"
    let screenSize = UIScreen.main.bounds
    let title = "타이틀"
    
    var body: some View {
        
        VStack {
            Text(title)
            TextField("텍스트 필드", text: $text)
            HStack {
                Button("추가") {
                    isShown.toggle()
                }
                Button("취소") {
                    isShown.toggle()
                }
            }
        }.padding()
            .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
    }
}
