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

// MARK: Listing 5-6. Declare a model as a `Function` structure

struct Function: Differentiable {
    var (a, b, c): (Float, Float, Float) = (1, 1, 1)
    
    func callAsFunction(_ x: Float) -> Float {
        a * pow(x, 3) + b * pow(x, 2) - c * x
    }
}

// MARK: Listing 5-7. Find the minima function having free parameters equation f(x) = ax^3 + bx^2 − cx for a dataset sampled from function g(x) = 5x^3 + 2x^2 − 3x

var x: Float = 0
let η: Float = 0.01
let epochCount = 174

// Model
var f = Function()

// Dataset
let inputs = [Float](stride(from: -1, to: 1, by: 0.01))
let outputs = inputs.map{ g($0) }

print("Before optimization")
dump(f)

// Optimization loop
for _ in 1...epochCount {
    for (x, t) in zip(inputs, outputs) {
        /// Derivative of `E` w.r.t. every differentiable parameter of `f`
        let 𝛁θE = gradient(at: f) { f -> Float in
            let y = f(x)
            let error = sumOfSquaresError(t, y)
            return error
        }
        // Optimization step: update θ to minimize `error`
        f.move(along: 𝛁θE.scaled(by: -η))
    }
}

print("After optimization")
dump(f)
