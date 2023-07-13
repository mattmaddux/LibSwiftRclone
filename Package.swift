// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibSwiftClone",
    platforms: [.macOS("14.0")],
    products: [
        .library(
            name: "LibSwiftClone",
            targets: ["LibSwiftClone"]
        )
    ],
    targets: [
        .target(
            name: "LibSwiftClone",
            dependencies: ["LibRcloneCShim"],
            path: "Sources/LibSwiftClone"
        ),
        .target(
            name: "LibRcloneCShim",
            dependencies: ["LibRcloneStatic"],
            path: "Sources/C"
        ),
        .binaryTarget(
            name: "LibRcloneStatic",
            path: "Libs/librclone.xcframework"
        ),
        .testTarget(
            name: "LibSwiftCloneTests",
            dependencies: ["LibSwiftClone"]
        ),
    ]
)
