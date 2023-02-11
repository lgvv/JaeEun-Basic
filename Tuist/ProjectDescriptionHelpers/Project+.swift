import ProjectDescription

extension Project {
    
    public static func make(
        name: String,
        targets: [Target]
    ) -> Project {
        Project(
            name: name,
            organizationName: "Curation-Corporation",
            options: .options( // 앱 아이콘을 넣어야 할 경우 삭제에 필요한 옵션
                disableBundleAccessors: true,
                disableSynthesizedResourceAccessors: true
                             ),
            targets: targets
        )
    }
    
    public static func framework(
        name: String,
        targets: [Target]
    ) -> Project {
        Project(
            name: name,
            organizationName: "Curation-Corporation",
            targets: targets
        )
    }
}
