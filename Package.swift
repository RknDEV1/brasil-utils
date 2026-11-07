// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BrasilUtils",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(name: "BrasilUtils", targets: ["BrasilUtils"])
    ],
    targets: [
        .target(name: "BrasilUtils"),
        .testTarget(name: "BrasilUtilsTests", dependencies: ["BrasilUtils"])
    ]
)
