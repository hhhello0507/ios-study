import SwiftUI

struct TestView: View {
    
    @ObservedObject private var viewModel = TestViewModel()
    
    var body: some View {
        VStack {
            Button("전송") {
                viewModel.sendMessage()
            }
        }
        .task {
            viewModel.registerSockect()
            viewModel.subcribe()
        }
    }
}
