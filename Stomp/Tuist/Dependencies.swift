import ProjectDescription

let dependencies = Dependencies(
    carthage: [
        .github(path: "https://github.com/facebookincubator/SocketRocket", requirement: .exact("0.7.0"))
    ],
    platforms: [.iOS]
)
