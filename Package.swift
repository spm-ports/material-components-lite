// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaterialComponents",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "MaterialComponents",
            targets: [
                "Availability",
                "AnimationTiming",
                "Buttons",
                "Chips",
                "Elevation",
                "Ink",
                "Palettes",
                "Ripple",
                "Shadow",
                "ShadowElevations",
                "ShadowLayer",
                "ShapeLibrary",
                "Shapes",
                "TextFields",
                "Typography"
            ]),
    ],
    dependencies: [
        .package(url:"https://github.com/spm-ports/material-text-accessibility-ios", from: "2.0.0"),
        .package(url:"https://github.com/spm-ports/material-internationalization-ios", from: "3.0.0")
    ],
    targets: [
        .target(name: "AnimationTiming",
                path: "components/AnimationTiming/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Availability",
                path: "components/Availability",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Buttons",
                dependencies: [
                    .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
                    .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
                    .target(name: "MDFInternationalizationHeaders"),
                    .target(name: "MDFTextAccessibilityHeaders"),
                    .target(name: "Elevation"),
                    .target(name: "Ink"),
                    .target(name: "Ripple"),
                    .target(name: "Shadow"),
                    .target(name: "ShadowElevations"),
                    .target(name: "ShadowLayer"),
                    .target(name: "Shapes"),
                    .target(name: "ShapeLibrary"),
                    .target(name: "Typography"),
                    .target(name: "Math")
                ],
                path: "components/Buttons/",
                exclude: [
                    "src/ButtonThemer",
                    "src/ColorThemer",
                    "src/ShapeThemer",
                    "src/Theming",
                    "src/TitleColorAccessibilityMutator",
                    "src/TypographyThemer",
                ],
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Chips",
                dependencies:[
                    .target(name: "Elevation"),
                    .target(name: "ShadowElevations"),
                    .target(name: "Shapes"),
                    .target(name: "ShapeLibrary"),
                    .target(name: "TextFields")
                ],
                path: "components/Chips/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Elevation",
                dependencies: [
                    .target(name:"Availability"),
                    .target(name:"Color"),
                    .target(name:"Math")
                ],
                path: "components/Elevation/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Ink",
                dependencies: [
                    .target(name: "Availability"),
                    .target(name: "Color"),
                    .target(name: "Math")
                ],
                path: "components/Ink/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Palettes",
                dependencies: [
                    
                ],
                path: "components/Palettes/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Ripple",
                dependencies:[
                    .target(name:"AnimationTiming"),
                    .target(name:"Availability"),
                    .target(name:"Color"),
                    .target(name:"Math")
                ],
                path: "components/Ripple/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Shadow",
                dependencies: [
                    .target(name: "Availability")
                ],
                path: "components/Shadow/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "ShadowElevations",
                path: "components/ShadowElevations/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "ShadowLayer",
                dependencies: [
                    .target(name:"ShadowElevations")
                ],
                path: "components/ShadowLayer/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "ShapeLibrary",
                dependencies:[
                    .target(name:"Shapes")
                ],
                path: "components/ShapeLibrary/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Shapes",
                dependencies:[
                    .target(name:"ShadowLayer"),
                    .target(name:"Color"),
                    .target(name:"Math")
                ],
                path: "components/Shapes/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "TextFields",
                dependencies:[
                    .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
                    .target(name: "MDFInternationalizationHeaders"),
                    .target(name:"Availability"),
                    .target(name:"AnimationTiming"),
                    .target(name:"Buttons"),
                    .target(name:"Elevation"),
                    .target(name:"Typography"),
                    .target(name:"Math"),
                    .target(name:"Palettes")
                ],
                path: "components/TextFields/",
                exclude:[
                    "src/ColorThemer",
                    "src/Theming",
                    "src/private/MDCTextField+Testing.h"
                ],
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Typography",
                dependencies: [
                    .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
                    .target(name: "MDFTextAccessibilityHeaders"),
                    .target(name: "Application"),
                    .target(name: "Math")
                ],
                path: "components/Typography/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Application",
                path: "components/private/Application/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Color",
                dependencies: [
                    .target(name:"Availability")
                ],
                path: "components/private/Color/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "Math",
                path: "components/private/Math/",
                sources: ["src"],
                publicHeadersPath: "src"),
        .target(name: "MDFInternationalizationHeaders",
                path: "include/MDFInternationalization/",
                sources: ["."],
                publicHeadersPath: "."),
        .target(name: "MDFTextAccessibilityHeaders",
                path: "include/MDFTextAccessibility/",
                sources: ["."],
                publicHeadersPath: ".")
    ]
)
