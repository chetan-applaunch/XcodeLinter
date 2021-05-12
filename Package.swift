// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Eigen",
    dependencies: [
      .package(url: "https://github.com/danger/swift.git", from: "1.0.0"),
      .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8"),
      .package(url: "https://github.com/Realm/SwiftLint", from: "0.28.1"),
      .package(url: "https://github.com/orta/Komondor", from: "1.0.0"),
    ],
    targets: [
        // This is just an arbitrary Swift file in the app, that has
        // no dependencies outside of Foundation, the dependencies section
        .target(name: "eigen", dependencies: ["Danger"], path: "Artsy", sources: ["Stringify.swift"]),
    ]
)

// The settings for the git hooks for our repo
#if canImport(PackageConfig)
    import PackageConfig

    let config = PackageConfig([
        "komondor": [
            // When someone has run `git commit`, first run
            // SwiftFormat and the auto-correcter for SwiftLint
            "pre-commit": [
                "swift run swiftformat .",
                "swift run swiftlint autocorrect --path Artsy/",
                "git add .",
            ],
        ]
    ])
#endif
