//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-22**. Declare an enumeration and print a statement according to an instance
enum Rainbow {
    case violet, indigo, blue, green, yellow, orange, red
}
// `Rainbow.violet` is similar to the following approach.
let favoriteColor: Rainbow = .indigo

switch favoriteColor {
case .violet:
    print("\(favoriteColor) has low wavelength and high frequency.")
case .red:
    print("\(favoriteColor) has high wavelength and low frequency.")
default:
    print("\(favoriteColor) has wavelength and frequency within the range of visible 🌈 spectrum.")
}
