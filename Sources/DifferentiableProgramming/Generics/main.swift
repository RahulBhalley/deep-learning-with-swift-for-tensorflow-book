//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-25. Declare the Rocket class with stored and computed properties and an initializer

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

// MARK: Listing 3-26. Inherit features of Rocket and refine to carry payload

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

// MARK: Listing 3-30. Swap values of two variables of the same type

func swapValues<T>(_ x: inout T, _ y: inout T) {
    let temporaryX = x
    x = y
    y = temporaryX
}

// Swapping `String` values
var x = "x"
var y = "y"
swapValues(&x, &y)
print("x: \(x) y: \(y)")

// Swapping custom type instance values
swapValues(&falcon9, &falconHeavy)
print(falcon9.description)
print(falconHeavy.description)

print()

// MARK: Listing 3-31. Find common and unique elements from two `Array<Int>` instances

func allCommonAndUniqueElements<T: Sequence, U: Sequence> (_ left: T, _ right: U) -> [T.Element]
where T.Element: Equatable, T.Element == U.Element {
    var result = [T.Element]()
    for leftItem in left {
        for rightItem in right {
            if leftItem == rightItem && !result.contains(leftItem) {
                result.append(leftItem)
            }
        }
    }
    return result
}

let fibonacciNumbers = [0, 1, 1, 2, 3, 5, 8, 13, 21]
let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
let commonNumbers = allCommonAndUniqueElements(fibonacciNumbers, oddNumbers)
print(commonNumbers)

print()

// MARK: Listing 3-32. Find common and unique elements from two `Array<Character>` or `String` instances

let machineLearning = "machine learning"
let deepLearning = "deep learning"
let commonCharacters = allCommonAndUniqueElements(machineLearning, deepLearning)
print(commonCharacters)

print()

// MARK: Listing 3-33. Demonstrate the generic type

struct Pair<T, U> {
    var x: T
    var y: U
    var description: String {
        "x: \(x) and y: \(y)"
    }
}

let pair = Pair(x: "x", y: 5)
print(pair.description)

let anotherPair = Pair<Vehicle, CargoRocket>(x: .car, y: falconHeavy)
print(type(of: pair))
print(type(of: anotherPair))
