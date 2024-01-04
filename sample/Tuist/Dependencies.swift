//
//  Dependencies.swift
//  Config
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init(
        [
            .remote(
                url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.4.0")
            )
        ]
    ),
    platforms: [.iOS]
)
