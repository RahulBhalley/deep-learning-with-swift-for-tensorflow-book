//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-20. Declare a closure to return Bool representing an integer’s positivity

print("Listing 3-20. Declare a closure to return Bool representing an integer’s positivity")
let isPositive = { (_ x: Int) -> Bool in
    return x > 0
}b
print(isPositive(-5))

print()

// MARK: Listing 3-21. Demonstrate trailing closures

func isEven(_ x: Int, also hasProperty: (Int) -> Bool) -> Bool {
    x % 2 == 0 && hasProperty(x)
}

let number = 2
let isEvenAndPositive = isEven(number, also: isPositive)
print(isEvenAndPositive)

let fibonacciNumbers = [0, 1, 1, 2, 3, 5, 8, 13, 21]
let isEvenAndFibonacciNumber = isEven(number) { number in
    fibonacciNumbers.contains(Int(number))
}
print(isEvenAndFibonacciNumber)
