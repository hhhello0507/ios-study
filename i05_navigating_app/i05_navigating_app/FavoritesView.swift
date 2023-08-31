//
//  FavoritesView.swift
//  i05_navigating_app
//
//  Created by dgsw8th71 on 2023/08/31.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Title(text: "Favorites")
                .padding(.bottom, 40)
            Text("Hobbies")
                .font(.title2)
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 60)
                }
                .padding()
            }
            .padding()
            
            Text("Foods")
                .font(.title2)
            HStack(spacing: 30) {
                ForEach(information.colors, id: \.self) { color in
                    color
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}


struct FavoritesView_Priviews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
