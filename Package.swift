import PackageDescription

let package = Package(
    name: "todoServer",
    targets: [
      Target(name: "Application", dependencies: [ .Target(name: "Generated") ]),
      Target(name: "todoServer", dependencies: [ .Target(name: "Application") ])
    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git",             majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git",       majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/CloudConfiguration.git", majorVersion: 2),
        .Package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", majorVersion: 1),

    ],
    exclude: ["src"]
)
