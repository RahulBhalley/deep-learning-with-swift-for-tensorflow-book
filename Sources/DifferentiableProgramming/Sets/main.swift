//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-7**. Set operations on even, odd, and whole numbers
let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let evenNumbers: Set = [0, 2, 4, 6, 8]
let wholeNumbers = oddNumbers.union(evenNumbers).sorted()
print("wholeNumbers: \(wholeNumbers)")
print("Even and odd numbers are subset of whole numbers: \(evenNumbers.union(oddNumbers).isSubset(of: wholeNumbers) ? "✓" : "⨯")")
