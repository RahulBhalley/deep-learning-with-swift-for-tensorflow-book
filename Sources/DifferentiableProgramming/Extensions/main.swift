//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-27. Extend Int to mutate its value when raised to some power

extension Int {
    mutating func raised(to power: Self) {
        assert(power > 0, "`power` must be a non-negative integer.")
        if power == 0 {
            self = 1
            return
        }
        var result = 1
        for _ in 1...power {
            result = result * self
        }
        self = result
    }
}

var number = 5
number.raised(to: 3)
print("Now `number` is \(number).")
