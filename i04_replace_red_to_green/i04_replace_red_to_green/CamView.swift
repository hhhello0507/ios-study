//
//  ContentView.swift
//  i04_replace_red_to_green
//
//  Created by dgsw8th71 on 2023/08/24.
//

import SwiftUI

struct CamView: View {
    @ObservedObject var viewModel = CamViewModel()
    var body: some View {
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
            .onAppear {
                viewModel.configure()
            }
            VStack {
                HStack {
                    Shutter(onClickShutter: {
                        viewModel.switchFlash()
                    }, isFlashOn: viewModel.isFlashOn)
                    .padding(.horizontal, 30)
                    
                    Silent(onClickSilent: {
                        viewModel.switchSilent()
                    }, isSilentOn: viewModel.isSilentModeOn)
                    .padding(.horizontal, 30)
                }
                .font(.system(size:25))
                .padding()
                
                Spacer() // cam
                
                HStack{
                    PreviewCam(onClickPreview: {
                        
                    })
                    .frame(width: 75, height: 75)
                    .padding()
                    Spacer()
                    CaptureCam(onClickCapture: viewModel.capturePhoto)
                    Spacer()
                    ChangeCam(onClickChangeCam: viewModel.changeCamera)
                        .frame(width: 75, height: 75)
                        .padding()
                }
            }
            .foregroundColor(.white)
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CamView()
    }
}


struct Shutter: View {
    var onClickShutter: () -> Void
    var isFlashOn: Bool
    var body: some View {
        Button(action: onClickShutter) {
            Image(systemName: isFlashOn ?
                  "speaker.fill" : "speaker")
            .foregroundColor(isFlashOn ? .yellow : .white)
        }
    }
}

struct Silent: View {
    var onClickSilent: () -> Void
    var isSilentOn: Bool
    var body: some View {
        Button(action: onClickSilent) {
            Image(systemName: isSilentOn ?
                  "bolt.fill" : "bolt")
            .foregroundColor(isSilentOn ? .yellow : .white)
        }
    }
}

struct PreviewCam: View {
    var onClickPreview: () -> Void
    var body: some View {
        Button(action: onClickPreview) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 5)
                .frame(width: 50, height: 50)
                .padding()
        }
    }
}

struct CaptureCam: View {
    var onClickCapture: () -> Void
    var body: some View {
        Button(action: onClickCapture) {
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 70, height: 70)
                .padding()
        }
    }
}

struct ChangeCam: View {
    var onClickChangeCam: () -> Void
    var body: some View {
        Button(action: onClickChangeCam) {
            Image(systemName: "arrow.triangle.2.circlepath.camera")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
    }
}
