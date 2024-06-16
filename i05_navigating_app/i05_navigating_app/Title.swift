//
//  TItle.swift
//  i05_navigating_app
//
//  Created by dgsw8th71 on 2023/08/31.
//

import Foundation
import SwiftUI

struct Title: View {
    let text: String
    var body: some View {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.black)
    }
}
