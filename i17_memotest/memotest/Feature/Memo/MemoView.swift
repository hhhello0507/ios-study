import SwiftUI

struct MemoView: View {
    
    @ObservedObject var viewModel = MemoViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(viewModel.memoList, id: \.id) {
                    Text($0.memo)
                }
            }
            NavigationLink {
                MemoCreateView()
            } label: {
                Image(systemName: "plus")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding()
            }
        }
        .task {
            await viewModel.loadMemo()
        }
        .navigationTitle("메모")
    }
}
