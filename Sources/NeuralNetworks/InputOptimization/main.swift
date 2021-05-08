//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 08/05/21.
//

import Foundation

// MARK: Listing 5-1. Declare configuration variables and function f(x) = 5x^3 + 2x^2 - 3x demonstrate maxima and minima optimization

var x: Float = 0
let η: Float = 0.01
let maxIterations = 100

@differentiable
func f(_ x: Float) -> Float {
    return 5 * pow(x, 3) + 2 * pow(x, 2) - 3 * x
}

print("Before optimization, ", terminator: "")
print("x: \(x) and f(x): \(f(x))")

// MARK: Listing 5-2. Find the maxima of the function f(x) = 5x^3 + 2x^2 − 3x

// Optimization loop
for _ in 1...maxIterations {
    /// Derivative of `f` w.r.t. `x`
    let 𝛁xF = gradient(at: x, in: { x -> Float in return f(x)})
    // Optimization step: update `x` to maximize `f`.
    x += η * 𝛁xF
}

print("After gradient ascent, ", terminator: "")
print("input: \(x) and output: \(f(x))")

// MARK: Listing 5-3. Find the minima of the function f(x) = 5x^3 + 2x^2 − 3x

// Reset the input to zero
x = 0

// Optimization loop
for _ in 1...maxIterations {
    /// Derivative of `f` w.r.t. `input`.
    let 𝛁xF = gradient(at: x) { x in f(x) }
    // Optimization step: update `x` to minimize `f`.
    x.move(along: 𝛁xF.scaled(by: -η))
}

print("After gradient descent, ", terminator: "")
print("input: \(x) and output: \(f(x))")
