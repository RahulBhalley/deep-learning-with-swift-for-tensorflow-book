//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

import _Differentiation

/// **Listing 3-37**. Show that differentiation of an Int instance is not possible
// @differentiable
// func failedDifferentiation(_ input: Float) -> Float {
//     Float(Int(input))
// }

/// **Listing 3-38**. Make the Point3D structure differentiable
struct Point3D: Differentiable, AdditiveArithmetic {
    var (x, y, z) = (0.0, 0.0, 0.0)
    @noDerivative
    var description: String {
        "Coordinates: (\(x), \(y), \(z))"
    }
}

var pointA = Point3D(x: 5, y: 2, z: 3)
var pointB = Point3D(x: 5, y: 2, z: 3)
let result = valueWithGradient(at: pointA) { pointA in
    (pointA + pointB).y
}
print("sum: \(result.value)")
print("𝛁sum: \(result.gradient.description)")

print()

/// **Listing 3-39**. Declare and demonstrate the usage of the `@differentiable` declaration
/// attribute on a computed property
extension Double {
    @differentiable
    var cubed: Self { self * self * self }
}

let x: Double = 5
print("\(x)^3 = \(x.cubed)")
let grad = gradient(at: x) { x in x.cubed }
print("Gradient of x^3 at \(x) is \(grad)")

print()

/// **Listing 3-40**. Demonstrate the declaration of custom derivatives in reverse-mode differentiation
func cube(_ x: Float) -> Float {
    x * x * x
}

let anotherX: Float = 4
print("Before customization, df/dx =", gradient(at: anotherX, in: { x in
    cube(x)
}))

// Uncomment the following custom derivative function to see the effect.
// @derivative(of: cube)
// func vjpCube(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
//     (value: cube(x), pullback: { chain in chain * 2 * x })
// }
// print("After customization, df/dx =", gradient(at: anotherX, in: { x in cube(x) }))

print()

/// **Listing 3-41**. Demonstrate the stopping of gradient computation through a graph
let yetAnotherX: Float = 5
let result1 = valueWithGradient(at: yetAnotherX) { x in
    x * x * withoutDerivative(at: x)
}
print("result1: \(result1)")

let result2 = valueWithGradient(at: yetAnotherX) { x in
    x * x * withoutDerivative(at: x) { y in
        y + 10
    }
}
print("result2: \(result2)")
