//
//  WeatherDayView.swift
//  i13_weather_app
//
//  Created by dgsw8th71 on 1/2/24.
//

import SwiftUI

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)˚")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
