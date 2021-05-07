// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "deep-learning-with-swift-for-tensorflow-book",
    platforms: [
        .macOS(.v11),
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/tensorflow/swift-models", .branch("main")),
    ],
    targets: [
        
        // MARK: Chapter 3: Differentiable Programming
        
        .target(
            name: "AdvancedOperators",
            path: "Sources/DifferentiableProgramming/AdvancedOperators"),
        
        .target(
            name: "AlgorithmicDifferentiation",
            path: "Sources/DifferentiableProgramming/AlgorithmicDifferentiation"),
        
        .target(
            name: "Arrays",
            path: "Sources/DifferentiableProgramming/Arrays"),
        
        .target(
            name: "Classes",
            path: "Sources/DifferentiableProgramming/Classes"),
        
        .target(
            name: "Closures",
            path: "Sources/DifferentiableProgramming/Closures"),
        
        .target(
            name: "ConditionalStatements",
            path: "Sources/DifferentiableProgramming/ConditionalStatements"),
        
        .target(
            name: "ControlTransfer",
            path: "Sources/DifferentiableProgramming/ControlTransfer"),
        
        .target(
            name: "Dictionaries",
            path: "Sources/DifferentiableProgramming/Dictionaries"),
        
        .target(
            name: "Differentiation",
            path: "Sources/DifferentiableProgramming/Differentiation"),
        
        .target(
            name: "EarlyExit",
            path: "Sources/DifferentiableProgramming/EarlyExit"),
        
        .target(
            name: "Enumerations",
            path: "Sources/DifferentiableProgramming/Enumerations"),
        
        .target(
            name: "ErrorHandling",
            path: "Sources/DifferentiableProgramming/ErrorHandling"),
        
        .target(
            name: "Extensions",
            path: "Sources/DifferentiableProgramming/Extensions"),
        
        .target(
            name: "Generics",
            path: "Sources/DifferentiableProgramming/Generics"),
        
        .target(
            name: "GlobalFunctions",
            path: "Sources/DifferentiableProgramming/GlobalFunctions"),
        
        .target(
            name: "Loops",
            path: "Sources/DifferentiableProgramming/Loops"),
        
        .target(
            name: "NestedFunctions",
            path: "Sources/DifferentiableProgramming/NestedFunctions"),
        
        .target(
            name: "Protocols",
            path: "Sources/DifferentiableProgramming/Protocols"),
        
        .target(
            name: "PythonInteroperability",
            path: "Sources/DifferentiableProgramming/PythonInteroperability"),
        
        .target(
            name: "Sets",
            path: "Sources/DifferentiableProgramming/Sets"),
        
        .target(
            name: "Structures",
            path: "Sources/DifferentiableProgramming/Structures"),
        
        .target(
            name: "Values",
            path: "Sources/DifferentiableProgramming/Values"),
        
        // MARK: Chapter 4: TensorFlow Basics
        
        .target(
            name: "EpochAndBatches",
            dependencies: [
                .product(name: "Datasets", package: "swift-models")
            ],
            path: "Sources/TensorFlowBasics/EpochAndBatches"),
        
        .target(
            name: "FromScratchForResearch",
            dependencies: [
                .product(name: "Datasets", package: "swift-models"),
                .product(name: "TrainingLoop", package: "swift-models"),
            ],
            path: "Sources/TensorFlowBasics/FromScratchForResearch"),
        
        .target(
            name: "ModelDefinition",
            path: "Sources/TensorFlowBasics/ModelDefinition"),
        
        .target(
            name: "TensorExplanation",
            path: "Sources/TensorFlowBasics/TensorExplanation"),
        
        .target(
            name: "TrainingAndTesting",
            dependencies: [
                .product(name: "Checkpoints", package: "swift-models"),
                .product(name: "Datasets", package: "swift-models"),
            ],
            path: "Sources/TensorFlowBasics/TrainingAndTesting"),
        
        .target(
            name: "TrainingLoopExample",
            dependencies: [
                .product(name: "Datasets", package: "swift-models"),
                .product(name: "TrainingLoop", package: "swift-models"),
            ],
            path: "Sources/TensorFlowBasics/TrainingLoopExample"),
    ]
)
