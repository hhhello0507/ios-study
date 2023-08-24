//
//  CamViewModel.swift
//  i04_replace_red_to_green
//
//  Created by dgsw8th71 on 2023/08/24.
//

import Foundation

class CamViewModel: ObservableObject {
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    
    func switchFlash() {
        isFlashOn.toggle()
    }
    
    func switchSilent() {
        isSilentModeOn.toggle()
    }
    
    func capturePhoto() {
        print("[CameraViewModel]: Photo captured!")
    }
    
    func changeCamera() {
        print("[CameraViewModel]: Camera changed!")
    }
}
