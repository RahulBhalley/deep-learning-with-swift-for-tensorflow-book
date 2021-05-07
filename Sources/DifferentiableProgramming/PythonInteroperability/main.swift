//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-42**. Import the PythonKit library
import PythonKit

/// **Listing 3-43**. Add two NumPy arrays
let np: PythonObject = Python.import("numpy")

let x = np.array([1, 4, 2, 5], dtype: np.float32)
let y = np.array([5, 2, 4, 1], dtype: np.float32)
print(x * y)

print()

/// **Listing 3-44**. Demonstrate the Python namespace
let myNamePy: PythonObject = "Rahul Bhalley"
print("myNamePy Swift type: \(type(of: myNamePy))")
print("myNamePy Python type: \(Python.type(myNamePy))")

/// **Listing 3-45**. Demonstrate operations on `PythonObject`s
var firstNumber: PythonObject = 30
var secondNumber: PythonObject = 6
let result = secondNumber / firstNumber
print("The result is \(result).")
print("Swift type is \(type(of: result)).")
print("Python type is \(Python.type(result)).")

print()

/// **Listing 3-46**. Type conversions between Swift types and `PythonObject`

// Conversion from Swift to Python type
let swiftFive: Int = 5 // Swift Int value
let pyFive = PythonObject(swiftFive) // Python int value
print("Python type of pyFive is \(Python.type(pyFive)).")
print("Swift type of pyFive is \(type(of: pyFive)).")

// Conversion from Python to Swift type
let pyDescription: PythonObject? = "Python interoperability feature is beautiful!" // Python str type
if let pyDescription = pyDescription {
    let swiftDescription = "Swift's \(pyDescription)"
    print("swiftDescription (conversion accomplished!): \(swiftDescription)")
}

print()

/// **Listing 3-47**. Plot an exponential function

// Import Python libraries
let plt = Python.import("matplotlib.pyplot")

// Declare variables
let xs = np.linspace(0, 5, 50)
let ys = np.exp(xs)

// Plot the values
plt.xlabel("Values")
plt.ylabel("Exponent of values")
plt.title("Exponential Function")
plt.plot(xs, ys, color: "violet")
plt.show()
