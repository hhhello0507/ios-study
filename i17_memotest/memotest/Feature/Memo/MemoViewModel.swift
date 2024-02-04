import SwiftUI

@MainActor
final class MemoViewModel: ObservableObject {
    @Published var memoList: Memos = []
    
    private let service = MemoService.live
    
    func loadMemo() async {
        do {
            memoList = try await service.getTodos()
            print(memoList)
        } catch(let e) {
            print(e)
        }
    }
}
