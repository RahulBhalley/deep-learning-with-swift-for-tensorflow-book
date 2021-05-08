//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 08/05/21.
//

import _Differentiation
import Foundation

// MARK: Listing 5-10. Declare a polynomial model

struct Polynomial: Differentiable {
    var weights: [Float]
    var bias: Float = 1
    @noDerivative var order = 1
    
    init(order: Int) {
        weights = Array(repeating: 1, count: order)
        self.order = order
    }
    
    @differentiable
    func callAsFunction(_ input: Float) -> Float {
        var output = bias
        for index in 0..<order {
            output += weights[index] * pow(input, Float(index))
        }
        return output
    }
}
