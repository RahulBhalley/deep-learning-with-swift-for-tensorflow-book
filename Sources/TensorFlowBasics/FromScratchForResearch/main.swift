//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

import TensorFlow

/// **Listing 4-11**. Define the dense layer
struct DenseLayer<Scalar: TensorFlowFloatingPoint>: Layer {
    typealias Input = Tensor<Scalar>
    typealias Output = Tensor<Scalar>
    
    var weight: Tensor<Scalar>
    var bias: Tensor<Scalar>
    
    init(inputSize: Int, outputSize: Int) {
        weight = Tensor<Scalar>(randomNormal: [inputSize, outputSize])
        bias = Tensor(zeros: [outputSize])
    }
    
    @differentiable
    func callAsFunction(_ input: Input) -> Output {
        matmul(input, weight) + bias
    }
}

/// **Listing 4-12**. Define the swish activation function
@differentiable
func swishActivation<Scalar: TensorFlowFloatingPoint>(_ input: Tensor<Scalar>) -> Tensor<Scalar> {
    input * sigmoid(input)
}

/// **Listing 4-13**. Define the L2 loss function
@differentiable(wrt: logits)
func l1Loss<Scalar: TensorFlowFloatingPoint>(
    logits: Tensor<Scalar>,
    labels: Tensor<Scalar>
) -> Tensor<Scalar> {
    abs(labels - logits).mean()
}

/// **Listing 4-14**. Define the stochastic gradient descent optimizer
class SGDOptimizer<Model: Differentiable>: Optimizer
where Model.TangentVector: VectorProtocol & ElementaryFunctions & KeyPathIterable, Model.TangentVector.VectorSpaceScalar == Float
{
    // The learning rate
    var learningRate: Float
    
    init(for model: Model, learningRate: Float) {
        self.learningRate = learningRate
    }
    
    func update(_ model: inout Model, along direction: Model.TangentVector) {
        model.move(along: direction.scaled(by: -learningRate))
    }
    
    required init(copying other: SGDOptimizer<Model>, to device: Device) {
        learningRate = other.learningRate
    }
}
