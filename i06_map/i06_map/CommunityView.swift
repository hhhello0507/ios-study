//
//  CommunityView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct CommunityView: View {
    @State private var isDetailViewActive = false
    @State var i = 0
    @State var isInit = false
    @ObservedObject private var vm: CommunityViewModel
    
    init() {
        _vm = ObservedObject(initialValue: CommunityViewModel())
        vm.initBoardList()
        print(i)
        i += 1
    }
    
    var body: some View {
        ZStack{}
        .ignoresSafeArea()
        .safeAreaInset(edge: .top) {
            ScrollView(.vertical) {
                VStack {
                    ForEach(vm.boardList ?? [], id: \.self) {board in
                        BoardView(titleText: board.title, createdTime: board.content) {
                            
                        }
                    }
                }
            }
            NavigationView {
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
        
        init(boardList: [BoardModel]? = nil) {
            self.boardList = boardList
        }
        
        func initBoardList() {
            httpClient.getBoardList { result in
                switch result {
                case .success(let boardList):
                    DispatchQueue.main.async {
                        self.boardList = boardList
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
