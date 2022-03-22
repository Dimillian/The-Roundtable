// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Networking",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(
      name: "Networking",
      targets: ["Networking"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMajor(from: "0.51.2")),
  ],
  targets: [
    .target(
      name: "Networking",
      dependencies: [
        .product(name: "Apollo", package: "apollo-ios")
      ],
      exclude: ["GQL/shared.graphql"]),
    .testTarget(
      name: "NetworkingTests",
      dependencies: ["Networking"]),
  ]
)
