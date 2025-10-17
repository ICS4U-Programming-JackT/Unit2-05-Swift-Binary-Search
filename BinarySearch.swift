import Foundation


// Custom error for invalid integer input
enum InputError: Error {
    case invalidInteger
}


// Converts a string to an integer or throws an error
func convertToInt(_ value: String) throws -> Int {
    guard let intValue = Int(value) else {
        throw InputError.invalidInteger
    }
    return intValue
}


// Creates and returns a sorted array of 10 random integers
func generateRandomArray() -> [Int] {
    let lowerBound = 0
    let upperBound = 100
    var numbers: [Int] = []


    for _ in 0..<10 {
        numbers.append(Int.random(in: lowerBound...upperBound))
    }


    return numbers.sorted()
}


// Performs a binary search for a target value
func search(_ numbers: [Int], for target: Int) -> Int {
   
    //Initialize high low mid and final index
    var high : Int = numbers.count  - 1
    var low : Int = 0
    var mid : Int = (high + low) / 2
    var fIndex : Int = -1


    // While low is bigger than high, adjust points
    while (high >= low) {


        // Adjust high and low to continually be within range
        // Make it go up or down based on mid element proximity to target
        if target > numbers[mid] {
            low = mid + 1
        } else if target < numbers[mid] {
            high = mid - 1
        }


        // Readjust mid outside of functions
        mid = (high + low) / 2


        //Check if target is mid element, return and adjust fIndex if so
        if target == numbers[mid] {
            fIndex = mid
            break
        }
    }
    return fIndex
}


// Main execution loop
let data = generateRandomArray()
while true {
   
    print("Random array: \(data)")
    print("Enter a number to search for (or 'q' to quit): ", terminator: "")


    guard let input = readLine() else { continue }


    if input.lowercased() == "q" {
        print("Goodbye!")
        break
    }


    do {
        let target = try convertToInt(input)
        let position = search(data, for: target)


        if position == -1 {
            print("The target number was not found.\n")
        } else {
            print("Found \(target) at index \(position).\n")
        }


    } catch {
        print("'\(input)' is not a valid integer.\n")
    }
}
