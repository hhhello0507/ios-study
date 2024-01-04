//
//  Dependencies.swift
//  Config
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/Alamofire/Alamofire.git",
                    requirement: .exact("5.4.0")),
            .remote(url: "https://github.com/pointfreeco/swift-composable-architecture.git", requirement: .exact("0.39.0"))
        ]
    ),
    platforms: [.iOS]
)
