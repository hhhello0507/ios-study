//
//  AlertProvider.swift
//  CustomAlert
//
//  Created by hhhello0507 on 7/25/24.
//

import Foundation

final class AlertProvider: ObservableObject {
    @Published var showAlert = false
    @Published var title: String = ""
    @Published var message: String?
    
    func present(_ title: String) {
        self.title = title
        self.showAlert = true
    }
}
