//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

import TensorFlow

/// **Listing 4-1**. Declare Tensor instances of various dimensions
let scalar = Tensor<Float>(10)
let vector = Tensor<Float>(ones: [5])
let matrix = Tensor<Float>(zeros: [4, 3])
let tensor = Tensor<Float>(repeating: 2, shape: [4, 3, 2])

// Print `Tensor`s
print("scalar: \(scalar)")
print("vector: \(vector)")
print("matrix:\n\(matrix)")
print("tensor:\n\(tensor)")
print()

// Ranks
print("scalar rank: \(scalar.rank)")
print("vector rank: \(vector.rank)")
print("matrix rank: \(matrix.rank)")
print("tensor rank: \(tensor.rank)")
print()

// Shapes
print("scalar shape: \(scalar.shape)")
print("vector shape: \(vector.shape)")
print("matrix shape: \(matrix.shape)")
print("tensor shape: \(tensor.shape)")
print()
