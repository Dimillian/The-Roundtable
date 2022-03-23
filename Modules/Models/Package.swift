// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Models",
  platforms: [
    .iOS(.v15),
    .macOS(.v10_14)
  ],
  products: [
    .executable(name: "ApolloCodegen", targets: ["ApolloCodegen"]),
    .library(name: "ApolloModels", targets: ["ApolloModels"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git",
             .upToNextMajor(from: "0.51.2")),
    .package(url: "https://github.com/apple/swift-argument-parser.git",
             .upToNextMinor(from: "0.3.0")),
  ],
  targets: [
    .executableTarget(
      name: "ApolloCodegen",
      dependencies: [
        .product(name: "ApolloCodegenLib", package: "apollo-ios"),
        .product(name: "ArgumentParser", package: "swift-argument-parser")
      ]),
    .target(
      name: "ApolloModels",
      dependencies: [
        .product(name: "Apollo", package: "apollo-ios")
      ]),
  ]
)
