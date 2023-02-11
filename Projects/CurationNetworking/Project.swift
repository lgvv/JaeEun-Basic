import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "CurationNetworking",
    targets: [
        .staticLibrary(
            name: "CurationNetworking",
            dependencies: [
                .external(name: "Alamofire")
            ]
        ),
        .unitTests(name: "CurationNetworking")
    ]
)
