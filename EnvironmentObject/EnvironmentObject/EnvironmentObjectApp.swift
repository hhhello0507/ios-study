//
//  AppMain.swift
//  DodamDodam
//
//  Created by Mercen on 3/12/24.
//

import SwiftUI

class A: ObservableObject {}

@main
struct EnvironmentObjectApp: App {
    
    @StateObject private var a = A()
//    @StateObject private var datePickerProvider = DatePickerProvider()
//    @StateObject private var timePickerProvider = TimePickerProvider()
    
    var body: some Scene {
        WindowGroup {
//            DodamModalProvider(
//                dialogProvider: dialogProvider,
//                datePickerProvider: datePickerProvider,
//                timePickerProvider: timePickerProvider
//            ) {
//                FlowPresenter(
//                    rootView: MainView()
//                        .environmentObject(dialogProvider)
//                        .environmentObject(datePickerProvider)
//                        .environmentObject(timePickerProvider)
//                )
            ContentView()
                .environmentObject(a)
//            }
//            .ignoresSafeArea()
        }
    }
}
