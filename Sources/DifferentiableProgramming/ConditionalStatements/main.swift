//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-14. Demonstrate an if-else statement
let marks = 75
if marks < 60 {
    print("Poor")
} else if marks >= 60 && marks <= 80 {
    print("Average")
} else {
    print("Excellent")
}

print()

// MARK: Listing 3-15. Demonstrate the switch statement
switch marks {
case let x where x < 60:
    print("Poor")
case 60...80:
    print("Average")
    fallthrough
default:
    print("Excellent")
}
