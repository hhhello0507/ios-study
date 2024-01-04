//
//  ColorSet.swift
//  swiftuitest
//
//  Created by dgsw8th71 on 1/4/24.
//

import SwiftUI
import Observation

@Observable
final class ColorSet {
  // Observable class
  // The color components are not private so any changes
  // get published to the views that are observing

  var foregroundRed = 0.0
  var foregroundGreen = 0.0
  var foregroundBlue = 0.0

  // Computed variables to create the RGB colors from the components
  var foregroundColor: Color {
    return Color(red: foregroundRed, green: foregroundGreen, blue: foregroundBlue)
  }
}
