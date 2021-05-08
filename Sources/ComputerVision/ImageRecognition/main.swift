//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 08/05/21.
//

// MARK: Listing 6-1. Import libraries

import Datasets
import Dispatch
import Foundation
import PythonKit
import TensorFlow
import TrainingLoop

let np = Python.import("numpy")

// MARK: Listing 6-2. Initialize configuration properties, device, and type aliases for the ResNet18 model and load the CIFAR-10 dataset

let inChannels: Int = 3
let classCount = 10
let imageSize = 128
let epochs = 25
let batchSize = 128

#if os(macOS)
let device = Device.defaultTFEager
#else
let device = Device.defaultXLA
#endif

typealias TFloat = Tensor<Float>
typealias Input = Tensor<Float>
typealias Output = Tensor<Float>

let imagenetteDataset = Imagenette(batchSize: batchSize, inputSize: .resized160, outputSize: imageSize, on: device)

// MARK: Listing 6-3. Program a convolutional and batch normalization layers block

struct ConvBN: Layer {
    var conv: Conv2D<Float>
    var norm: BatchNorm<Float>
    
    init(
        filterShape: (Int, Int, Int, Int),
        strides: (Int, Int) = (1, 1),
        padding: Padding = .same
    ) {
        conv = Conv2D(filterShape: filterShape, strides: strides, padding: padding, useBias: false)
        norm = BatchNorm(featureCount: filterShape.3, momentum: 0.1, epsilon: 1e-5)
    }
    
    @differentiable
    func callAsFunction(_ input: Input) -> Output {
        input.sequenced(through: conv, norm)
    }
}

// MARK: Listing 6-4. Program a convolutional residual block and consider the downsampling for different input and output filters to it

struct ResidualBlock: Layer {
    var convBN1: ConvBN
    var convBN2: ConvBN
    var projection: ConvBN
    
    init(
        inFilters: Int,
        outFilters: Int
    ) {
        if inFilters == outFilters {
            convBN1 = ConvBN(filterShape: (3, 3, inFilters, outFilters))
            convBN2 = ConvBN(filterShape: (3, 3, outFilters, outFilters))
            // In this case, we don't use `projection`.
            projection = ConvBN(filterShape: (1, 1, 1, 1))
        } else {
            convBN1 = ConvBN(filterShape: (3, 3, inFilters, outFilters), strides: (2, 2))
            convBN2 = ConvBN(filterShape: (3, 3, outFilters, outFilters), strides: (1, 1))
            projection = ConvBN(filterShape: (1, 1, inFilters, outFilters), strides: (2, 2))
        }
    }
    
    @differentiable
    func callAsFunction(_ input: Input) -> Output {
        let residual = convBN1.conv.filter.shape[2] != convBN2.conv.filter.shape[3] ? projection(input) : input
        let convBN1Output = relu(convBN1(input))
        let convBN2Output = relu(convBN2(convBN1Output) + residual)
        return convBN2Output
    }
}

// MARK: Listing 6-5. Define the residual convolutional network with 18 layers

struct ResNet18: Layer {
    var initialConvBN = ConvBN(filterShape: (7, 7, inChannels, 64), strides: (2, 2))
    var maxPool = MaxPool2D<Float>(poolSize: (3, 3), strides: (2, 2), padding: .same)
    var block1 = Sequential {
        ResidualBlock(inFilters: 64, outFilters: 64)
        ResidualBlock(inFilters: 64, outFilters: 64)
    }
    var block2 = Sequential {
        ResidualBlock(inFilters: 64,  outFilters: 128)
        ResidualBlock(inFilters: 128, outFilters: 128)
    }
    var block3 = Sequential {
        ResidualBlock(inFilters: 128, outFilters: 256)
        ResidualBlock(inFilters: 256, outFilters: 256)
    }
    var block4 = Sequential {
        ResidualBlock(inFilters: 256, outFilters: 512)
        ResidualBlock(inFilters: 512, outFilters: 512)
    }
    var globalAvgPool = GlobalAvgPool2D<Float>()
    var flatten = Flatten<Float>()
    var classifier: Dense<Float>
    
    init(classCount: Int) {
        classifier = Dense(inputSize: 512, outputSize: classCount)
    }
    
    @differentiable
    func callAsFunction(_ input: Input) -> Output {
        let initialConvBNOutput = maxPool(relu(initialConvBN(input)))
        let convFeatures = initialConvBNOutput.sequenced(through: block1, block2, block3, block4)
        let logits = convFeatures.sequenced(through: globalAvgPool, flatten, classifier)
        return logits
    }
}

// MARK: Listing 6-6. Implement custom checkpoint reading and writing methods on the Layer protocol using the NumPy library with Python interoperability

extension Layer {
    public func writeCheckpoint(to file: String) throws {
        var parameters = Array<PythonObject>()
        for kp in self.recursivelyAllWritableKeyPaths(to: TFloat.self) {
            parameters.append(self[keyPath: kp].makeNumpyArray())
        }
        np.save(file, np.array(parameters))
    }
    
    public mutating func readCheckpoint(from file: String) throws {
        let parameters = np.load(file, allow_pickle: true)
        for (index, kp) in self.recursivelyAllWritableKeyPaths(to: TFloat.self).enumerated() {
            self[keyPath: kp] = TFloat(numpy: parameters[index])!
        }
    }
}

// MARK: Listing 6-7. Define a function to automatically write checkpoint during training

func writeCheckpoint<L: TrainingLoopProtocol>(_ loop: inout L, event: TrainingLoopEvent) throws {
    DispatchQueue.global(qos: .userInitiated).async {
        switch event {
        case .epochEnd:
            do {
                try model.writeCheckpoint(to: "/tmp/ResNet18.npy")
            } catch {
                print(error)
            }
        default:
            break
        }
    }
}

// MARK: Listing 6-8. Initialize the model and optimizer, and train the model

// Initialize the model and optimizer
var model = ResNet18(classCount: classCount)
var optimizer = SGD(for: model, learningRate: 0.1, momentum: 0.9)

// Training setup
var trainingLoop = TrainingLoop(
    training: imagenetteDataset.training,
    validation: imagenetteDataset.validation,
    optimizer: optimizer,
    lossFunction: softmaxCrossEntropy,
    callbacks: [writeCheckpoint])

// Train the model
try! trainingLoop.fit(&model, epochs: epochs, on: device)
