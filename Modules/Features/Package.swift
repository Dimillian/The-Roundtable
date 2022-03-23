// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Features",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(name: "Items", targets: ["Items"]),
    .library(name: "Magic", targets: ["Magic"]),
  ],
  dependencies: [
    .package(name: "Networking", path: "./Networking"),
    .package(name: "Models", path: "./Models"),
    .package(name: "SharedUI", path: "./SharedUI"),
  ],
  targets: [
    .target(
      name: "Magic",
      dependencies: ["Networking",
                     "SharedUI",
                     .product(name: "ApolloModels", package: "Models"),],
      exclude: ["GQL/magic.graphql"]),
    .target(
      name: "Items",
      dependencies: ["Networking",
                     "SharedUI",
                     .product(name: "ApolloModels", package: "Models")],
      exclude: ["GQL/items.graphql"]),
  ]
)
