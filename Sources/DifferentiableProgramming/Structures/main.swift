//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-23**. Declare a nested structure and initialize its instances
struct Mammal {
    enum LivingZone {
        case land, water
    }
    var livingZone: LivingZone
    var legsCount: Int?
}

let human = Mammal(livingZone: .land, legsCount: 2)
let injuredHuman = Mammal(livingZone: .land, legsCount: 0)
let fish = Mammal(livingZone: .water, legsCount: nil)

/// **Listing 3-24**. Extend `Mammal` to include a curated description
extension Mammal {
    var description: String {
        var text = "Lives \(livingZone == .land ? "on" : "in") \(livingZone)"
        if let legsCount = legsCount {
            if legsCount == 0 {
                text += " and cannot walk because it has \(legsCount) legs."
            } else if legsCount > 0 {
                text += " and can walk with its \(legsCount) legs."
            }
        } else {
            text += " and swims."
        }
        return text
    }
}

print(human.description)
print(injuredHuman.description)
print(fish.description)
