//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-2**. Declare instances containing simple values
var firstNumber = 10
let pi = 3.14159
var secondNumber: Float = 123.456

/// **Listing 3-3**. Check the type of instance
print("firstNumber: \(type(of: firstNumber))")
print("pi: \(type(of: pi))")
print("secondNumber: \(type(of: secondNumber))")

print()

/// **Listing 3-4**. Declare an optional-type instance
var optionalInt: Int? = 5
if let value = optionalInt {
    print("optionalInt has value: \(value)")
}
