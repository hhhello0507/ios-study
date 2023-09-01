//
//  MapView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/08/31.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6632493, longitude: 128.4141269),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
}
