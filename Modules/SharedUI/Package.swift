// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SharedUI",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(
      name: "SharedUI",
      targets: ["SharedUI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher",
             .upToNextMajor(from: "7.2.0")),
    .package(name: "ApolloModels", path: "./ApolloModels"),
  ],
  targets: [
    .target(
      name: "SharedUI",
      dependencies: ["ApolloModels",
                     .product(name: "Kingfisher", package: "Kingfisher")],
      resources: [
        .process("Resources/Colors.xcassets"),
        .process("Resources/Fonts")
      ]),
  ]
)
