// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios-common-kit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ios-common-kit",
            targets: ["ios-common-kit"]
        ),
        .library(
            name: "TrendCore",
            targets: ["TrendCore"]
        ),
        .library(
            name: "TrendConfiguration",
            targets: ["TrendConfiguration"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.1"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.1.2"),
        .package(url: "https://github.com/relatedcode/ProgressHUD", from: "13.6.1"),
        .package(url: "https://github.com/AnasAlhasani/XcodeConfig", from: "1.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ios-common-kit"
        ),
        .target(
            name: "TrendConfiguration",
            dependencies: [
                .product(
                    name: "XcodeConfig",
                    package: "XcodeConfig"
                )
            ]
        ),
        .target(
            name: "TrendCore",
            dependencies: [
                "TrendConfiguration",

                .product(
                    name: "Alamofire",
                    package: "Alamofire"
                ),

                .product(
                    name: "Resolver",
                    package: "Resolver"
                )
            ]
        )
    ]
)
