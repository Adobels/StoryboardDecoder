// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoryboardDecoder",
    products: [
        .library(name: "StoryboardDecoder", targets: ["StoryboardDecoder"])
    ],
    dependencies: [
        .package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "7.0.2")
    ],
    targets: [
        .target(name: "StoryboardDecoder", dependencies: ["SWXMLHash"], path: "Sources"),
        .testTarget(name: "DecoderTests", dependencies: ["StoryboardDecoder"], resources: [
            .process("Resources")
        ]),
        .testTarget(name: "DiscoverTests", dependencies: ["StoryboardDecoder"])
    ]
)
