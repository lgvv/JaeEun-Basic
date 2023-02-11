import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "CoreKit",
    targets: [
        .staticLibrary(
            name: "CoreKit",
            dependencies: []
        ),
        .unitTests(name: "CoreKit"),
    ]
)
