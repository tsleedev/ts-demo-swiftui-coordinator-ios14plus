// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureMain",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FeatureMain",
            targets: ["FeatureMain"]),
    ],
    dependencies: [
        .package(path: "../FeatureCommon"),
        .package(path: "../FeatureA"),
        .package(path: "../FeatureB"),
        .package(path: "../FeatureC"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeatureMain",
            dependencies: [
                "FeatureCommon",
                "FeatureA",
                "FeatureB",
                "FeatureC",
            ]
        ),
        .testTarget(
            name: "FeatureMainTests",
            dependencies: ["FeatureMain"]),
    ]
)
