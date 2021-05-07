//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-10**. Declare a `for-in` loop to iterate over a range of values
for value in 1...5 {
    print("5 x \(value) = \(5 * value)")
}

print()

/// **Listing 3-11**. Access corresponding elements of two arrays simultaneously
let fruits = ["Apple", "Banana", "Orange", "Watermelon"]
let colors = ["red", "yellow", "orange", "green"]
for (fruit, color) in zip(fruits, colors) {
    print("\(fruit) has \(color) color.")
}

print()

/// **Listing 3-12**. Demonstrate the `while` loop
var a = 5
while a > 0 {
    print(a, terminator: " ")
    a -= 1
}

print()

/// **Listing 3-13**. Demonstrate the `repeat-while` loop
var b = 0
repeat {
    print(b, terminator: " ")
    b += 1
    if b > 6 { break }
} while b > 0
print()
