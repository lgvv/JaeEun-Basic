import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "App",
  targets: [
    Target.appTarget(
        name: "Curation",
        dependencies: [
            .project(target: "DesignSystem", path: "../DesignSystem"),
            .project(target: "CoreKit", path: "../Core/CoreKit"),
            .project(target: "CurationNetworking", path: "../CurationNetworking"),
            .project(target: "CurationLocalStorage", path: "../CurationLocalStorage"),
            .external(name: "SnapKit")
        ]
    ),
    Target.unitTests(name: "Curation"),
  ]
)
