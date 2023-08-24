//
//  ContentView.swift
//  02_crud
//
//  Created by dgsw8th71 on 2023/08/18.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                MyLabel(text: "환영합니다", isCenter: true)
                Spacer()
                    .frame(height: 30)
                NavigationLink(destination: LoginView()) {
                    MyPrettyText(text: "로그인")
                }
                HStack {
                    Text("계정이 없으신가요? ")
                        .foregroundColor(.gray)
                    NavigationLink(destination: JoinView()) {
                        Text("회원가입")
                    }
                }
                Spacer()
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
