//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 08/05/21.
//

import _Differentiation
import Foundation

// MARK: Listing 5-4. Sum of squared errors function

@differentiable
func sumOfSquaresError(_ t: Float, _ y: Float) -> Float {
    0.5 * pow(t - y, 2)
}

// MARK: Listing 5-5. Data-generating function g(x) = 5x^3 + 2x^2 − 3x

/// Data generating function
func g(_ x: Float) -> Float {
    5 * pow(x, 3) + 2 * pow(x, 2) - 3 * x
}

// MARK: Listing 5-8. Declare a linear model

struct LinearModel: Differentiable {
    var (w, b): (Float, Float) = (1, 1)
    
    func callAsFunction(_ x: Float) -> Float {
        w * x + b
    }
}

// MARK: Listing 5-9. Train to fit the LinearModel to samples from function g(x)

let η: Float = 0.01
let epochCount = 174

// Model
var model = LinearModel()

// Dataset
let inputs = [Float](stride(from: -1, to: 1, by: 0.01))
let outputs = inputs.map { g($0) }

print("Before optimization")
dump(model)

// Optimization loop
for _ in 1...epochCount {
    for (x, t) in zip(inputs, outputs) {
        /// Derivative of `E` w.r.t. every differentiable parameter of `model`
        let 𝛁θE = gradient(at: model) { model -> Float in
            let y = model(x)
            let error = sumOfSquaresError(t, y)
            return error
        }
        // Optimization step: update θ to minimize `error`
        model.move(along: 𝛁θE.scaled(by: -η))
    }
}

print("After optimization")
dump(model)
