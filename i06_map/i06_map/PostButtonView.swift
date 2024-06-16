//
//  PostButtonView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct PostButtonView: View {
    let callback: () -> Void
    var body: some View {
        Button(action: {
            callback()
            print("test")
        }) {
            Image(systemName: "pencil.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
        }
        .shadow(radius: 2)
    }
}
