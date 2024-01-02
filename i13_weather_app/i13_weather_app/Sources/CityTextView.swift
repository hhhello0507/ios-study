//
//  CityTextView.swift
//  i13_weather_app
//
//  Created by dgsw8th71 on 1/2/24.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}
