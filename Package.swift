// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MetalSprocketsShaderGraph",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
    ],
    products: [
        .library(
            name: "ShaderGraph",
            targets: ["ShaderGraph"]
        ),
        .library(
            name: "ShaderGraphSupport",
            targets: ["ShaderGraphSupport"]
        ),
        .library(
            name: "MetalSprocketsShaderGraph",
            targets: ["MetalSprocketsShaderGraph"]
        ),
    ],
    dependencies: [
        .package(path: "../MetalSprockets"),
        .package(url: "https://github.com/schwa/MetalCompilerPlugin", from: "0.1.4"),


    ],
    targets: [
        .target(
            name: "ShaderGraph",
            dependencies: [
                "ShaderGraphShaders",
            ]
        ),
        .target(
            name: "ShaderGraphSupport",
            dependencies: [
                "ShaderGraph",
            ]
        ),
        .target(
            name: "MetalSprocketsShaderGraph",
            dependencies: [
                "ShaderGraph",
                .product(name: "MetalSprockets", package: "MetalSprockets"),
            ]
        ),
        .target(
            name: "ShaderGraphShaders",
            exclude: ["Metal"],
            publicHeadersPath: "include",
            plugins: [
                .plugin(name: "MetalCompilerPlugin", package: "MetalCompilerPlugin")
            ]
        ),
        .testTarget(
            name: "ShaderGraphTests",
            dependencies: ["ShaderGraph", "ShaderGraphSupport"]
        ),
        .testTarget(
            name: "MetalSprocketsShaderGraphTests",
            dependencies: ["MetalSprocketsShaderGraph"]
        ),
    ]
)
