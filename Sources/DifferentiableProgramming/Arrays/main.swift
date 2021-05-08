//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

// MARK: Listing 3-4: Iterate over an array instance.

let deepLearningPioneers = ["Geoffrey Hinton", "Yoshua Bengio", "Yann LeCun", "Jürgen Schmidhuber"]
for name in deepLearningPioneers {
  print(name)
}

print()

// MARK: Listing 3-5: Access each element with its index in a sorted array.

for (index, name) in deepLearningPioneers.sorted().enumerated() {
  print("\(index). \(name)")
}
