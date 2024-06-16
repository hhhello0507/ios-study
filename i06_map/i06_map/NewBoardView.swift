//
//  NewBoardView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct NewBoardView: View {
    @State var title: String = ""
    @State var content: String = ""
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            TextField("제목을 입력해주세요", text: $title)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            TextEditor(text: $content)
                .padding()
                .scrollContentBackground(.hidden)
                .background(Color(uiColor: .secondarySystemBackground))
            Spacer()
        }
        .padding()
        .navigationTitle("글쓰기")
    }
}

struct NewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NewBoardView()
    }
}
