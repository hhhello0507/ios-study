//
//  MemoCreateViewModel.swift
//  memotest
//
//  Created by dgsw8th71 on 2/4/24.
//

import Foundation

@MainActor
final class MemoCreateViewModel: ObservableObject {
    
    private let service = MemoService.live
    
    func createMemo(memo: String) async {
        do {
            let _ = try await service.postTodos(MemoCreateRequest(memo: memo, createdAt: "2029년 1월 1일"))
        } catch(let e) {
            print(e)
        }
    }

}
