// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionCalling-AWSBedrock",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FunctionCalling-AWSBedrock",
            targets: ["FunctionCalling-AWSBedrock"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/FunctionCalling/FunctionCalling", from: "0.5.0"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "1.2.48")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FunctionCalling-AWSBedrock",
            dependencies: [
                .product(name: "FunctionCalling", package: "FunctionCalling"),
                .product(name: "AWSBedrockRuntime", package: "aws-sdk-swift")
            ]
        ),
        .testTarget(
            name: "FunctionCalling-AWSBedrockTests",
            dependencies: ["FunctionCalling-AWSBedrock"]
        )
    ]
)
