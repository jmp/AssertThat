// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "AssertThat",
    products: [
        .library(name: "AssertThat", targets: ["AssertThat"])
    ],
    targets: [
        .target(name: "AssertThat"),
        .testTarget(name: "AssertThatTests", dependencies: ["AssertThat"])
    ]
)
