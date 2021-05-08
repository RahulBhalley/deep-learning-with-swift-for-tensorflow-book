//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-18. Declare a global function

enum Vehicle {
    case car, train
}

func drive(vehicle: Vehicle) -> String {
    switch vehicle {
    case .car:
        return "Vroom vroom!"
    case .train:
        return "Choo choo!"
    }
}

let sound = drive(vehicle: .car)
print(sound)
print(type(of: drive))
