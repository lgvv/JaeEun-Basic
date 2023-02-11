import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "CoreKit",
    targets: [
        .staticLibrary(
            name: "CoreKit",
            dependencies: [
                .project(target: "BaseArchitecture", path: "../CoreKit"),
                .project(target: "CurationExtensions", path: "../CoreKit"),
                .project(target: "CurationProtocols", path: "../CoreKit"),
                .project(target: "Models", path: "../CoreKit"),
            ]
        ),
        .unitTests(name: "CoreKit"),
        .staticLibraryTarget(name: "Models"),
        .staticLibraryTarget(name: "BaseArchitecture"),
        .staticLibraryTarget(name: "CurationExtensions"),
        .staticLibraryTarget(name: "CurationProtocols")
    ]
)
