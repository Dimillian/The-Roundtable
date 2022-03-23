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
    .library(name: "World", targets: ["World"]),
    .library(name: "Tabbar", targets: ["Tabbar"]),
  ],
  dependencies: [
    .package(name: "Networking", path: "./Networking"),
    .package(name: "Models", path: "./Models"),
    .package(name: "SharedUI", path: "./SharedUI"),
  ],
  targets: [
    .target(
      name: "Tabbar",
      dependencies: [
        "SharedUI",
        "Magic",
        "Items",
        "World"
      ]),
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
    .target(
      name: "World",
      dependencies: ["Networking",
                     "SharedUI",
                     .product(name: "ApolloModels", package: "Models")],
      exclude: ["GQL/world.graphql"]),
  ]
)
