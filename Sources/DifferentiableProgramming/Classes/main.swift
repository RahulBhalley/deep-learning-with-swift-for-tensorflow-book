//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-25**. Declare the Rocket class with stored and computed properties and an initializer
class Rocket {
    var name: String? = nil
    var vacuumThrust: Int = 0
    var description: String {
        return "\(name ?? "Rocket") has \(vacuumThrust) kN thrust in vacuum."
    }
    init(name: String? = nil, vacuumThrust: Int = 0) {
        self.name = name
        self.vacuumThrust = vacuumThrust
    }
}

var rocketA = Rocket()
var rocketB = Rocket(name: "ABCRocket")
print(rocketA.description)
print(rocketB.description)

print()

/// **Listing 3-26**. Inherit features of Rocket and refine to carry payload
final class CargoRocket: Rocket {
    var payload: Int
    override var description: String {
        return "\(name!) carries \(payload) kg and has \(vacuumThrust) kN thrust in vacuum."
    }
    init(name: String?, vacuumThrust: Int, payload: Int) {
        self.payload = payload
        super.init(name: name, vacuumThrust: vacuumThrust)
    }
}

var falcon9 = CargoRocket(name: "Falcon 9", vacuumThrust: 8_227, payload: 22_800)
var falconHeavy = CargoRocket(name: "Falcon Heavy", vacuumThrust: 24_681, payload: 63_800)
print(falcon9.description)
print(falconHeavy.description)
