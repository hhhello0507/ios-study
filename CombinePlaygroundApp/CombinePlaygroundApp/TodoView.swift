import SwiftUI

public struct TodoView: View {
    
    @ObservedObject private var viewModel: TodoViewModel
    
    public init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        let fetchCreateTodo = viewModel.fetchCreateTodo
        ZStack {
            Group {
                switch (viewModel.todos) {
                case .success(let todos):
                    let todos = viewModel.searchText.isEmpty ? todos : viewModel.filteredTodos
                    List {
                        ForEach(todos, id: \.id) {
                            Text($0.content)
                        }
                    }
                case .failure:
                    ContentUnavailableView("불러오기 실패", systemImage: "xmark.app.fill")
                case .fetching:
                    ProgressView()
                }
            }
            .searchable(text: $viewModel.searchText)
            VStack {
                Spacer()
                HStack {
                    TextField("안 할 일을 입력하세요", text: $viewModel.todo)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                    Button {
                        viewModel.createTodo()
                    } label: {
                        Text("추가")
                            .padding()
                            .background(fetchCreateTodo == .fetching ? .gray : .blue)
                            .foregroundStyle(.white)
                            .clipShape(Circle())
                    }
                    .disabled(fetchCreateTodo == .fetching)
                }
                .padding()
            }
        }
        .navigationTitle("NOT TO DO LIST")
        .onAppear {
            viewModel.fetchTodos()
        }
    }
}
