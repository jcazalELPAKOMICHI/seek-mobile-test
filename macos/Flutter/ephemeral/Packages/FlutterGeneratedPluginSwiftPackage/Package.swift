// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .macOS("10.14")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "firebase_core", path: "/Users/jcazal/.pub-cache/hosted/pub.dev/firebase_core-3.12.0/macos/firebase_core"),
        .package(name: "local_auth_darwin", path: "/Users/jcazal/.pub-cache/hosted/pub.dev/local_auth_darwin-1.4.3/darwin/local_auth_darwin")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "firebase-core", package: "firebase_core"),
                .product(name: "local-auth-darwin", package: "local_auth_darwin")
            ]
        )
    ]
)
