// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AssertThat",
    products: [
        .library(name: "AssertThat", targets: ["AssertThat"]),
    ],
    targets: [
        .target(name: "AssertThat"),
        .testTarget(name: "AssertThatTests", dependencies: ["AssertThat"]),
    ]
)
