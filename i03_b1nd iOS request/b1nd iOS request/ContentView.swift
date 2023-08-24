//
//  ContentView.swift
//  b1nd iOS request
//
//  Created by dgsw8th71 on 2023/08/18.
//

import SwiftUI

let backgroundColor = Color(hex: "F8F8F8")

struct OnBoardView: View {
    @State var name: String = ""
    @State var pw: String = ""
    @State var showAlert: Bool = false
    @State var alertMsg: String = ""
    @Binding var isJoin: Bool
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        B1ndTitleText(text: "B", color: .blue)
                        B1ndTitleText(text: "1ND 일기", color: .black)
                    }
                    Spacer()
                        .frame(height: 100)
                    B1ndTextField(hint: "이름을 입력해주세요.", text: $name)
                    Spacer()
                        .frame(height: 20)
                    B1ndSecureField(hint: "비밀번호를 입력해주세요.", text: $pw)
                    Spacer()
                        .frame(height: 20)
                    B1ndButton(text: "로그인") {
                        if isValid() {
                            isJoin = true
                        }
                    }
                    AuthDetail()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(backgroundColor)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertMsg), dismissButton: .default(Text("확인")))
                }
                
                
            }
        }
        
    }
    
    func isValid() -> Bool {
        if name.isEmpty {
            showAlert(msg: "이름을 입력해주세요")
            return false
        } else if pw.isEmpty {
            showAlert(msg: "비밀번호를 입력해주세요")
            return false
        }
        return true
    }
    
    func showAlert(msg: String) {
        alertMsg = msg
        showAlert = true
    }
}

struct AuthDetail: View {
    @State var isJoin = false
    @State var isFindPw = false
    
    var body: some View {
        Spacer()
            .frame(height: 20)
        HStack(spacing: 0) {
            Text("계정이 없으신가요? ")
                .font(.system(size: 14))
            NavigationLink(
                destination: JoinScreen(),
                isActive: $isJoin) {
                    Button("회원가입 하기") {
                        isJoin = true
                    }
                }
            .font(.system(size: 14))
        }
        Spacer()
            .frame(height: 10)
        HStack(spacing: 0) {
            Text("혹시 비밀번호를 깜빡하셨나요? ")
                .font(.system(size: 14))
            NavigationLink(
                destination: FindPwScreen(),
                isActive: $isFindPw) {
                    Button("비밀번호 찾기") {
                        isFindPw = true
                    }
                }
            .font(.system(size: 14))
        }
    }
}
struct B1ndTitleText: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.system(size: 42))
            .fontWeight(.semibold)
            .foregroundColor(color)
    }
}

struct B1ndSubTitleText: View {
    let text: String
    let color: Color = .black
    var body: some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.regular)
            .foregroundColor(color)
    }
}


struct B1ndTextField: View {
    
    let hint: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            TextField(hint, text: $text)
                .padding()
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.blue, lineWidth: 2))
                .cornerRadius(8)
            Spacer()
                .frame(width: 20)
        }
    }
}
struct B1ndSecureField: View {
    
    let hint: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            SecureField(hint, text: $text)
                .padding()
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                .cornerRadius(8)
            Spacer()
                .frame(width: 20)
        }
    }
}

struct B1ndButton: View {
    let text: String
    let callback: () -> Void
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            Button(action: callback) {
                Text(text)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            Spacer()
                .frame(width: 20)
        }
    }
}

struct JoinScreen: View {
    @State var name: String = ""
    @State var pw: String = ""
    @State var pwCheck: String = ""
    @State var showAlert = false
    @State var alertMsg: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 20)
                B1ndTextField(hint: "이름을 입력해주세요.", text: $name)
                Spacer()
                    .frame(height: 20)
                B1ndSecureField(hint: "비밀번호를 입력해주세요.", text: $pw)
                Spacer()
                    .frame(height: 20)
                B1ndSecureField(hint: "비밀번호를 확인해주세요.", text: $pwCheck)
                Spacer()
                B1ndButton(text: "회원가입") {
                    if isValid() {
                        showAlert(msg: "회원가입 성공!")
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(backgroundColor)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(text: "회원가입"))
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMsg), dismissButton: .default(Text("확인")))
            }
        }
    }
    
    func isValid() -> Bool {
        if name.isEmpty {
            showAlert(msg: "이름을 입력해주세요")
            return false
        } else if pw.isEmpty {
            showAlert(msg: "비밀번호를 입력해주세요")
            return false
        } else if pwCheck != pw {
            showAlert(msg: "비밀번호가 일치하지 않습니다")
            return false
        }
        return true
    }
    
    func showAlert(msg: String) {
        alertMsg = msg
        showAlert = true
    }
}


struct FindPwScreen: View {
    @State var name: String = ""
    @State var showAlert = false
    @State var alertMsg: String = ""
    @State var findedPw: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 20)
                B1ndTextField(hint: "이름을 입력해주세요.", text: $name)
                Spacer()
                    .frame(height: 20)
                HStack {
                    Spacer()
                        .frame(width: 20)
                    B1ndSubTitleText(text: findedPw)
                    Spacer()
                }
                Spacer()
                B1ndButton(text: "찾기") {
                    if isValid() {
                        findedPw = "당신의 비밀번호는" + String(Int.random(in: 0...99)) + "** 입니다"
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(backgroundColor)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(text: "회원가입"))
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMsg), dismissButton: .default(Text("확인")))
            }
        }
    }
    
    func isValid() -> Bool {
        if name.isEmpty {
            showAlert(msg: "이름을 입력해주세요")
            return false
        }
        return true
    }
    
    func showAlert(msg: String) {
        alertMsg = msg
        showAlert = true
    }
}


struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var text: String = ""
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.black)
            }
            Text(text)
                .font(.system(size: 20))
        }
    }
}

//

struct NavigationTest : View {
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                DetailView()
            }
            .navigationBarTitle("Navigation")
        }
    }
}

struct DetailView: View {
    let arr = ["Hello", "World"]
    var body: some View {
        NavigationStack {
            List(arr, id: \.self) { a in
                NavigationLink(a) {
                    MoreDetailView(text: a)
                }
            }
            .navigationBarTitle("Detail", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("삭제") {}
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("완료") {}
                }
            }
        }
    }
}

let dummyList = [
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??"),
    ("2023년 06월 18일 (일)", "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??")
]

struct DiaryScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    HStack(spacing: 0) {
                        Spacer().frame(width: 20)
                        VStack(spacing: 20) {
                            ForEach(dummyList, id: \.0) { tuple in
                                DiaryItem(tuple: tuple)
                            }
                        }
                        Spacer().frame(width: 20)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        AddButton()
                        Spacer()
                            .frame(width: 20)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AddButton: View {
    @State var isPost = false
    var body: some View {
        NavigationLink(
            destination: DiaryPostScreen(),
            isActive: $isPost) {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 53))
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                }
            }
    }
}

struct DiaryItem: View {
    let tuple: (String, String)
    var body: some View {
        HStack(spacing: 0) {
            Spacer().frame(width: 10)
            VStack(alignment: .leading, spacing: 4) {
                Spacer().frame(height: 10)
                DiaryTitle(text: tuple.0)
                Spacer().frame(height: 4)
                DiarySubTitle(text: tuple.1)
                Spacer().frame(height: 10)
            }
            Spacer().frame(width: 10)
        }
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
        .cornerRadius(8)
    }
}

struct DiaryTitle: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.medium)
    }
}

struct DiarySubTitle: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 14))
    }
}

struct DiaryPostScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert: Bool = false
    @State var alertMsg: String = ""
    @State var text: String = ""
    let characterLimit: Int = 100
    
    func showAlert(msg: String) {
        alertMsg = msg
        showAlert = true
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer().frame(height: 20)
                    HStack {
                        Spacer().frame(width: 20)
                        TextEditor(text: $text)
                            .frame(height: 160)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(8)
                            .onChange(of: text) { newValue in
                                if newValue.count > characterLimit {
                                    text = String(newValue.prefix(characterLimit))
                                }
                            }
                        Spacer().frame(width: 20)
                    }
                    Spacer()
                }
                
                if text.isEmpty {
                    VStack {
                        Spacer().frame(height: 28)
                        HStack {
                            Spacer().frame(width: 26)
                            Text("일기를 작성해주세요")
                                .foregroundColor(.gray)
                                .disabled(true)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .allowsHitTesting(false)
                    
                }
                VStack {
                    Spacer().frame(height: 149)
                    HStack {
                        Spacer().frame(width: 33)
                        Text(String(text.count) + " / \(characterLimit)")
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    Spacer().frame(height: 149)
                    HStack {
                        Spacer()
                        Button("완료") {
                            showAlert(msg: "작성이 완료되었습니다.")
                            
                        }
                        .disabled(text.isEmpty)
                        Spacer().frame(width: 33)
                    }
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(backgroundColor)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(text: "일기 쓰기"))
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMsg), dismissButton: .default(Text("확인"), action: {
                    presentationMode.wrappedValue.dismiss()
                }))
            }
        }
    }
}

struct B1ndTextEditor: View {
    var body: some View {
        HStack{
            
        }
    }
}

struct MoreDetailView: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        B1ndApp()
    }
}
