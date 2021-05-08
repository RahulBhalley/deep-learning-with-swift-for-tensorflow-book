//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

import Checkpoints
import Datasets
import Foundation
import TensorFlow

// MARK: Listing 4-3. Define the `LeNet` model by conforming to the `Layer` protocol

struct LeNet: Layer {
    typealias Input = Tensor<Float>
    typealias Output = Tensor<Float>
    
    var convBlock = Sequential {
        Conv2D<Float>(filterShape: (5, 5, 3, 6), activation: relu)
        MaxPool2D<Float>(poolSize: (2, 2), strides: (2, 2))
        Conv2D<Float>(filterShape: (5, 5, 6, 16), activation: relu)
        MaxPool2D<Float>(poolSize: (2, 2), strides: (2, 2))
    }
    var flatten = Flatten<Float>()
    var denseBlock = Sequential {
        Dense<Float>(inputSize: 16 * 5 * 5, outputSize: 120, activation: relu)
        Dense<Float>(inputSize: 120, outputSize: 84, activation: relu)
        Dense<Float>(inputSize: 84, outputSize: 10, activation: identity)
    }
    
    @differentiable
    func callAsFunction(_ input: Input) -> Output {
        input.sequenced(through: convBlock, flatten, denseBlock)
    }
}

// MARK: Listing 4-4. Conform `LeNet` to the `Checkpointable` protocol

extension LeNet: Checkpointable {}

// MARK: Listing 4-5. Declare directory location for checkpointing the model

let checkpointDirectory = URL(fileURLWithPath: "/Users/rahulbhalley/Desktop/Checkpoints", isDirectory: true)

// MARK: Listing 4-6. Train the LeNet model and save checkpoints

// Define the default device
let device = Device.defaultXLA

// Load CIFAR 10 dataset
let dataset = CIFAR10(batchSize: 128, on: device)

// Initialize the LeNet model
var model = LeNet()
model = .init(copying: model, to: device)

// Initialize the optimizer
var optimizer = SGD(for: model, learningRate: 0.01, momentum: 0.9)
optimizer = .init(copying: optimizer, to: device)

// MARK: Listing 4-7. Define one training step for the model

func trainingStep(samples: Tensor<Float>, labels: Tensor<Int32>) {
    // Compute gradients
    let 𝛁θmodel = gradient(at: model) { model -> Tensor<Float> in
        let logits = model(samples)
        let loss = softmaxCrossEntropy(logits: logits, labels: labels)
        return loss
    }
    optimizer.update(&model, along: 𝛁θmodel)
}

// MARK: Listing 4-8. Define a training loop executable for multiple epochs

func trainingLoop(epochCount: Int = 5) {
    epochLoop: for (epochStep, epoch) in dataset.training.prefix(epochCount).enumerated() {
        batchLoop: for batch in epoch {
            // Get data
            let samples = Tensor<Float>(copying: batch.data, to: device)
            let labels = Tensor<Int32>(copying: batch.label, to: device)
            
            // Training step
            trainingStep(samples: samples, labels: labels)
        }
        
        // Print statistics
        print("epoch: \(epochStep + 1)/\(epochCount)\ttest accuracy: \(testAccuracy)")
        
        // Write checkpoint
        do {
            try model.writeCheckpoint(to: checkpointDirectory, name: "\(type(of: model))")
        } catch {
            print(error)
        }
    }
}

// Train the model
trainingLoop()

// MARK: Listing 4-9. Define a computed property to calculate accuracy of the model on a validation set

var testAccuracy: Float {
    let totalSamples = 10000
    var correct = 0
    for batch in dataset.validation {
        let (data, label) = (batch.data, batch.label)
        let prediction = softmax(model(data)).argmax(squeezingAxis: 1)
        for index in 0..<data.shape[0] {
            if prediction[index] == label[index] { correct += 1 }
        }
    }
    return Float(correct) / Float(totalSamples)
}
