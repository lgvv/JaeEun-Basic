import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "CurationLocalStorage",
    targets: [
        .staticLibrary(
            name: "CurationLocalStorage"
        ),
        .unitTests(name: "CurationLocalStorage")
    ]
)
