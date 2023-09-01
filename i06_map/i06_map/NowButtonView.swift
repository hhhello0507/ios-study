//
//  NowButton.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import SwiftUI

struct NowButtonView: View {
    let isFocus: Bool
    var body: some View {
        Button(action: {
            print("test")
        }) {
            Image(getImage())
                .resizable()
                .frame(width: 60, height: 60)
        }
        .shadow(radius: 2)
    }
    
    func getImage() -> String {
        if isFocus {
            return "focus"
        } else {
            return "no_focus"
        }
    }
}

struct NowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NowButtonView(isFocus: true)
    }
}
