//
//  HomeView.swift
//  i05_navigating_app
//
//  Created by dgsw8th71 on 2023/08/31.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Title(text: "All About")
                .padding()
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            Text(information.name)
                .font(.title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
