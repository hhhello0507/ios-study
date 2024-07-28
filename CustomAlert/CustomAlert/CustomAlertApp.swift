//
//  CustomAlertApp.swift
//  CustomAlert
//
//  Created by hhhello0507 on 7/25/24.
//

import SwiftUI

@main
struct CustomAlertApp: App {
    var body: some Scene {
        WindowGroup {
            AlertPresenter {
                ContentView()
            }
        }
    }
}
