//
//  LoginView.swift
//  02_crud
//
//  Created by dgsw8th71 on 2023/08/18.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var pw: String = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    var body: some View {
        VStack {
            MyLabel(text: "이메일")
            MyTextField(hint: "이메일을 입력해주세요", text: $email)
            
            MyLabel(text: "비밀번호")
            MyTextField(hint: "비밀번호를 입력해주세요", text: $pw)
            
            Spacer()
            MyPrettyButton(text: "로그인") {
                print("login!")
                validUserInfo()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("넹")))
        }
    }
    
    func validUserInfo() {
        if (email.isEmpty) {
            showAlert = true
            alertMessage = "이메일을 제대로 입력해주세요"
        } else if (pw.isEmpty) {
            showAlert = true
            alertMessage = "비밀번호를 제대로 입력해주세요"
        }
    }
}
