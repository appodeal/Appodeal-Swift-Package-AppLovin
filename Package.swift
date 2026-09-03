// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealAppLovinAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealAppLovinAdapter",
            targets: ["AppodealAppLovinAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package", exact: "13.6.4"),
    ],
    targets: [
        .target(
            name: "AppodealAppLovinAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppodealAppLovinAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealAppLovinAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAppLovinAdapter/13.6.4.0/aa0f48a78703/AppodealAppLovinAdapter.xcframework.zip",
            checksum: "aa0f48a78703e6146d69fafd236288adb76a88c260c80d0a4f2c0217cd711220"
        ),

    ]
)
