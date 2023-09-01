//
//  BoardView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct BoardView: View {
    let titleText: String
    let createdTime: String
    let callback: () -> Void
    
    var body: some View {
        Button(action: {
            callback()
        }) {
            HStack {
                Text(titleText)
                    .font(.title3)
                    .foregroundColor(.black)
                Spacer()
                Text(createdTime)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(titleText: "in preview", createdTime: "1분 전") {
            
        }
    }
}
