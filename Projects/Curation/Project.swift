import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "App",
  targets: [
    Target.appTarget(
        name: "Curation",
        dependencies: [
            .project(target: "CoreKit", path: "../Core/CoreKit"),
            .project(target: "DesignSystem", path: "../DesignSystem"),
            .project(target: "CurationLocalStorage", path: "../CurationLocalStorage"),
            .project(target: "CurationNetworking", path: "../CurationNetworking"),
            .project(target: "BaseArchitecture", path: "../Core/CoreKit"),
            .project(target: "CurationExtensions", path: "../Core/CoreKit"),
            .project(target: "CurationProtocols", path: "../Core/CoreKit"),
            .project(target: "Models", path: "../Core/CoreKit"),
            .external(name: "SnapKit")
        ]
    ),
    Target.unitTests(name: "Curation"),
  ]
)
