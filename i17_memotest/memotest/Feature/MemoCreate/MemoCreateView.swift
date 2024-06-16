//
//  MemoCreateView.swift
//  memotest
//
//  Created by dgsw8th71 on 2/4/24.
//

import SwiftUI

struct MemoCreateView: View {
    
    @State var memo = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = MemoCreateViewModel()
    
    var body: some View {
        VStack {
            TextField("메모를 입력하세요", text: $memo)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
                if !memo.isEmpty {
                    Task {
                        await viewModel.createMemo(memo: memo)
                        dismiss()
                    }
                }
            } label: {
                Text("저장")
            }
        }
        .padding(.horizontal, 20)
    }
}
