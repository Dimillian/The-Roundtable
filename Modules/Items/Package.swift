// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Items",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(
      name: "Items",
      targets: ["Items"]),
  ],
  dependencies: [
    .package(name: "Networking", path: "./Networking"),
    .package(name: "ApolloModels", path: "./ApolloModels"),
    .package(name: "SharedUI", path: "./SharedUI"),
  ],
  targets: [
    .target(
      name: "Items",
      dependencies: ["Networking", "ApolloModels", "SharedUI"],
      exclude: ["GQL/items.graphql"]),
    .testTarget(
      name: "ItemsTests",
      dependencies: ["Items"]),
  ]
)
