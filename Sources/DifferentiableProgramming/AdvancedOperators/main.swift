//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-35**. Declare a structure and implement an advanced operator.
struct Point3D {
    var (x, y, z) = (0.0, 0.0, 0.0)
    var description: String {
        "Coordinates: (\(x), \(y), \(z))"
    }
}

extension Point3D {
    static func + (left: Self, right: Self) -> Self {
        Point3D(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
    }
}

let pointA = Point3D(x: 1, y: 2, z: 3)
let pointB = Point3D(x: 4, y: 5, z: 6)
print((pointA + pointB).description)
