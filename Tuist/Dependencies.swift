import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .exact("5.6.0")),
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .exact("5.6.4")),
        .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .exact("6.5.0")),
        .remote(url: "https://github.com/kean/Nuke.git", requirement: .exact("11.6.2")),
    ],
    platforms: [.iOS]
)
