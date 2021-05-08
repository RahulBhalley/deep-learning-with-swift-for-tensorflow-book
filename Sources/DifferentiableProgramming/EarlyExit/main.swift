//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-17. Demonstrate the usage of the guard statement

func welcome(language: [String: String]) {
    guard let name = language["name"] else {
        print("Welcome!")
        return
    }
    print("Welcome \(name)!")
}
welcome(language: [:])
welcome(language: ["name": "Swift"])
