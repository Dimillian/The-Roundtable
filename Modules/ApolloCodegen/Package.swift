// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ApolloCodegen",
  platforms: [
    .macOS(.v10_14)
  ],
  dependencies: [
    .package(name: "Apollo",
             url: "https://github.com/apollographql/apollo-ios.git",
             .upToNextMajor(from: "0.51.2")),
    .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "0.3.0")),
  ],
  targets: [
    .target(
      name: "ApolloCodegen",
      dependencies: [
        .product(name: "ApolloCodegenLib", package: "Apollo"),
        .product(name: "ArgumentParser", package: "swift-argument-parser")
      ]),
  ]
)
