//
//  BackgroundView.swift
//  i13_weather_app
//
//  Created by dgsw8th71 on 1/2/24.
//

import SwiftUI

struct BackgroundView: View {
    
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.gray.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}
