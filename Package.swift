// swift-tools-version:5.4
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
        
        .executableTarget(name: "AdvancedOperators",
                path: "Sources/DifferentiableProgramming/AdvancedOperators"),
        
        .executableTarget(name: "AlgorithmicDifferentiation",
                path: "Sources/DifferentiableProgramming/AlgorithmicDifferentiation"),
        
        .executableTarget(name: "Arrays",
                path: "Sources/DifferentiableProgramming/Arrays"),
        
        .executableTarget(name: "Classes",
                path: "Sources/DifferentiableProgramming/Classes"),
        
        .executableTarget(name: "Closures",
                path: "Sources/DifferentiableProgramming/Closures"),
        
        .executableTarget(name: "ConditionalStatements",
                path: "Sources/DifferentiableProgramming/ConditionalStatements"),
        
        .executableTarget(name: "ControlTransfer",
                path: "Sources/DifferentiableProgramming/ControlTransfer"),
        
        .executableTarget(name: "Dictionaries",
                path: "Sources/DifferentiableProgramming/Dictionaries"),
        
        .executableTarget(name: "Differentiation",
                path: "Sources/DifferentiableProgramming/Differentiation"),
        
        .executableTarget(name: "EarlyExit",
                path: "Sources/DifferentiableProgramming/EarlyExit"),
        
        .executableTarget(name: "Enumerations",
                path: "Sources/DifferentiableProgramming/Enumerations"),
        
        .executableTarget(name: "ErrorHandling",
                path: "Sources/DifferentiableProgramming/ErrorHandling"),
        
        .executableTarget(name: "Extensions",
                path: "Sources/DifferentiableProgramming/Extensions"),
        
        .executableTarget(name: "Generics",
                path: "Sources/DifferentiableProgramming/Generics"),
        
        .executableTarget(name: "GlobalFunctions",
                path: "Sources/DifferentiableProgramming/GlobalFunctions"),
        
        .executableTarget(name: "Loops",
                path: "Sources/DifferentiableProgramming/Loops"),
        
        .executableTarget(name: "NestedFunctions",
                path: "Sources/DifferentiableProgramming/NestedFunctions"),
        
        .executableTarget(name: "Protocols",
                path: "Sources/DifferentiableProgramming/Protocols"),
        
        .executableTarget(name: "PythonInteroperability",
                path: "Sources/DifferentiableProgramming/PythonInteroperability"),
        
        .executableTarget(name: "Sets",
                path: "Sources/DifferentiableProgramming/Sets"),
        
        .executableTarget(name: "Structures",
                path: "Sources/DifferentiableProgramming/Structures"),
        
        .executableTarget(name: "Values",
                path: "Sources/DifferentiableProgramming/Values"),
        
        // MARK: Chapter 4: TensorFlow Basics
        
        .executableTarget(name: "EpochAndBatches",
                dependencies: [
                    .product(name: "Datasets", package: "swift-models")
                ],
                path: "Sources/TensorFlowBasics/EpochAndBatches"),
        
        .executableTarget(name: "FromScratchForResearch",
                dependencies: [
                    .product(name: "Datasets", package: "swift-models"),
                    .product(name: "TrainingLoop", package: "swift-models"),
                ],
                path: "Sources/TensorFlowBasics/FromScratchForResearch"),
        
        .executableTarget(name: "ModelDefinition",
                path: "Sources/TensorFlowBasics/ModelDefinition"),
        
        .executableTarget(name: "TensorExplanation",
                path: "Sources/TensorFlowBasics/TensorExplanation"),
        
        .executableTarget(name: "TrainingAndTesting",
                dependencies: [
                    .product(name: "Checkpoints", package: "swift-models"),
                    .product(name: "Datasets", package: "swift-models"),
                ],
                path: "Sources/TensorFlowBasics/TrainingAndTesting"),
        
        .executableTarget(name: "TrainingLoopExample",
                dependencies: [
                    .product(name: "Datasets", package: "swift-models"),
                    .product(name: "TrainingLoop", package: "swift-models"),
                ],
                path: "Sources/TensorFlowBasics/TrainingLoopExample"),
    ]
)
