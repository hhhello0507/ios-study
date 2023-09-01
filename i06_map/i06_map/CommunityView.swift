//
//  CommunityView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI
import Combine

struct CommunityView: View {
    @State private var isDetailViewActive = false
    @State var isInit = false
    @ObservedObject private var vm = CommunityViewModel()
    
    init() {
        self.vm.initBoardList()
    }
    
    var body: some View {
        ZStack{}
        .ignoresSafeArea()
        .safeAreaInset(edge: .top) {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(vm.boardList ?? [], id: \.self) { board in
                            BoardView(titleText: board.title, createdTime: board.content) {
    
                            }
                        }
                    }
                }
                NavigationLink(destination: NewBoardView(), isActive: $isDetailViewActive) {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            PostButtonView {
                                isDetailViewActive = true
                            }
                        }
                        .padding()
                    }
                }
                
            }
        }
    }
}

extension CommunityView {
    class CommunityViewModel: ObservableObject {
        @Published var boardList: [BoardModel]?
        var httpClient = HttpClient()
        private var cancellables = Set<AnyCancellable>()
        
        init(boardList: [BoardModel]? = nil) {
            self.boardList = boardList
        }
        
        func initBoardList() {
            httpClient.getBoardList { result in
                switch result {
                case .success(let boardList):
                    DispatchQueue.main.async {
                        self.boardList = boardList
                        print(boardList)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
