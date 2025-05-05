// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "XCTParameterize",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "XCTParameterize",
            targets: ["XCTParameterize"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "601.0.1"),
    ],
    targets: [
        .macro(
            name: "XCTMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "XCTParameterize", dependencies: ["XCTMacros"]),
        .executableTarget(
            name: "XCTClient",
            dependencies: [
                "XCTParameterize"
            ]
        ),
        .testTarget(
            name: "XCTTests",
            dependencies: [
                "XCTMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
