//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-19**. Declare a nested function
func outerFunction() -> () -> Int {
    func innerFunction() -> Int {
        print("Running inner function.")
        return 0
    }
    print("Running outer function.")
    return innerFunction
}

let someInnerFunction = outerFunction()
print("someInnerFunction type: \(type(of: someInnerFunction))")
let someInt = someInnerFunction()
print("someInt: \(someInt)")
