//
//  CommunityView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct CommunityView: View {
    @State var arr = [("ㅎㅇ", "1분 전"), ("제갈제갈제갈", "1분 전"), ("ㅋㅋㅋ", "1분 전")]
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(0 ..< 3, id: \.self) {i in
                    BoardView(titleText: arr[i].0, createdTime: arr[i].1) {
                        
                    }
                }
            }
            
            // todo
            
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
