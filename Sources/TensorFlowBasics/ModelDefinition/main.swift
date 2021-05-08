//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

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
