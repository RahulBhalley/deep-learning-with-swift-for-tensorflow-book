//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-28. Declare and use `ProfileProtocol`

protocol ProfileProtocol {
    var name: String { get }
    var age: Int { get set }
    var email: String { get set }
}

struct Person: ProfileProtocol {
    let name: String
    var age: Int
    var email: String
}

var rahulbhalley = Person(name: "Rahul Bhalley", age: 24, email: "rahulbhalley@icloud.com")

// MARK: Listing 3-29. Extend `ProfileProtocol` to provide common implementation

extension ProfileProtocol {
    var details: String { "Name: \(name), age: \(age), email: \(email)" }
}

print(rahulbhalley.details)
