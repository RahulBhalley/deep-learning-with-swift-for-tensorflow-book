//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-16. Use a continue control transfer statement in a for-in loop

let totalSteps = 50
let range = stride(from: 0, to: totalSteps, by: 10)
print("range: \(Array(range))")

for step in range {
    if step == 30 { continue }
    print("step: \(step)")
}
