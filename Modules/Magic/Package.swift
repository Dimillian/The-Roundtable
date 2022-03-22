// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Magic",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(
      name: "Magic",
      targets: ["Magic"]),
  ],
  dependencies: [
    .package(name: "Networking", path: "./Networking"),
    .package(name: "ApolloModels", path: "./ApolloModels"),
    .package(name: "SharedUI", path: "./SharedUI"),
  ],
  targets: [
    .target(
      name: "Magic",
      dependencies: ["Networking", "ApolloModels", "SharedUI"],
      exclude: ["GQL/magic.graphql"]),
    .testTarget(
      name: "MagicTests",
      dependencies: ["Magic"]),
  ]
)
