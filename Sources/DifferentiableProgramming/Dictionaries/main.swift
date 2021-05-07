//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-8**. Define a dictionary and access its value
let wheelsCount = ["unicycle": 1, "bicycle": 2, "rickshaw": 3, "car": 4]
print("A rickshaw has \(wheelsCount["rickshaw"]!) wheel(s).")

print()

/// **Listing 3-9**. Safely access a dictionary value with optional binding
if let unicycle = wheelsCount["unicycle"] {
    print("A unicycle has \(unicycle) wheel(s).")
}
