// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AssertThat",
    products: [
        .library(name: "AssertThat", targets: ["AssertThat"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "AssertThat", dependencies: []),
        .testTarget(name: "AssertThatTests", dependencies: ["AssertThat"]),
    ]
)
