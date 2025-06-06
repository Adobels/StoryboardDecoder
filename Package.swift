// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoryboardDecoder",
    products: [
        .library(name: "StoryboardDecoder", targets: ["Decoder"])
    ],
    dependencies: [
        .package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "7.0.2")
    ],
    targets: [
        .target(name: "Decoder", dependencies: ["SWXMLHash"], path: "Sources"),
        .testTarget(name: "DecoderTests", dependencies: ["Decoder"]),
        .testTarget(name: "DiscoverTests", dependencies: ["Decoder"])
    ]
)
