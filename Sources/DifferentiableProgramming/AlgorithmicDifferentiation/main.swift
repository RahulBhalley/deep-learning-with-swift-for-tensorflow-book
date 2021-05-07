//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

struct DualNumber<T: FloatingPoint> {
    var value: T
    var derivative: T
}

extension DualNumber {
    /// Applies sum rule
    static func + (left: Self, right: Self) -> Self {
        DualNumber(
            value: left.value + right.value,
            derivative: left.derivative + right.derivative)
    }
    
    /// Applies sum rule
    static func - (left: Self, right: Self) -> Self {
        DualNumber(
            value: left.value - right.value,
            derivative: left.derivative - right.derivative)
    }
    
    // Applies product rule
    static func * (left: Self, right: Self) -> Self {
        DualNumber(value: left.value * right.value,
                   derivative: left.derivative * right.value + left.value * right.derivative)
    }
    
    /// Applies quotient rule
    static func / (left: Self, right: Self) -> Self {
        DualNumber(value: left.value / right.value,
                   derivative: (left.derivative * right.value - left.value * right.derivative) / (right.value * right.value))
    }
}

let x = DualNumber(value: 3, derivative: 1)
let expression = x*x*x + x
print("expression value: \(expression.value)")
print("expression derivative: \(expression.derivative)")
