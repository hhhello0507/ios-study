//
//  CamViewModel.swift
//  i04_replace_red_to_green
//
//  Created by dgsw8th71 on 2023/08/24.
//

import Foundation
import AVFoundation
import SwiftUI

class CamViewModel: ObservableObject {
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    private let model: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    
    init() {
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
    }
    
    func configure() {
        model.requestAndCheckPermissions()
    }
    
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
