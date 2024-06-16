//
//  MySheetAndFullScreenView.swift
//  i08_just_view_practice
//
//  Created by dgsw8th71 on 2023/09/08.
//

import Foundation
import SwiftUI

struct MySheetAndFullScreenCover: View {
    
    @State var isShownSheet = false
    @State var isShownFullScreenCover = false
    
    var body: some View {
        
        VStack {
            Button {
                self.isShownSheet.toggle()
            } label: {
                Text("Show sheet")
            }
            .sheet(isPresented: $isShownSheet) {
                Text("sheet view")
            }
            .padding()
            
            Button {
                self.isShownFullScreenCover.toggle()
            } label: {
                Text("Show Full Screen Cover")
            }
            .fullScreenCover(isPresented: $isShownFullScreenCover) {
                MyFullScreenCover(isShownFullScreenCover: $isShownFullScreenCover)
            }
            Path { path in
                path.move(to: CGPoint(x: 200, y: 0))
                path.addLine(to: CGPoint(x: 200, y: 200))
            }
            .stroke(.blue, lineWidth: 10)
        }
    }
}

struct pre: PreviewProvider {
    static var previews: some View {
        MySheetAndFullScreenCover()
    }
}
