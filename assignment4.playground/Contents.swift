import UIKit

var greeting = "Hello, playground"


//1
var number = 5
func factorial (_ number: Int) {
    var result = 1
    
    
    for i in 1...number {
        result *= i
    }
    
   print("The factorial of this number is:  \(result)")
}

factorial(number)


//2
func fibonacci (n: Int) {
    var fib = [0,1]
    
    if n < 1 { // if less than 1 we skip this loop
        return
    } else if n == 1 {
        print(fib[0])
        return // if equals 1 we print only the first element
    } else if n == 2 {
        print(fib[0])
        print(fib[1])
        return //if equals 1 we print the first and the second element
    }
    
    print(fib[0])
    print(fib[1])
    
    for i in 2..<n {
        let fibNext = fib[i-1] + fib[i-2]
        fib.append(fibNext)
        print(fibNext)
    }
    
}

print(fibonacci(n: 20))

//3
func palindrome (word: String) -> Bool {
    let wordToCheck = word.lowercased().filter{ $0.isLetter }
    let reversedWord = String(word.reversed())
    let count = word.count
    let lastIndex = wordToCheck.index(wordToCheck.startIndex, offsetBy: count / 2)
    
    
    for i in 0..<count / 2 {
            let startChar = wordToCheck[wordToCheck.index(wordToCheck.startIndex, offsetBy: i)]
            let endChar = wordToCheck[wordToCheck.index(wordToCheck.startIndex, offsetBy: count - i - 1)]
            
            if startChar != endChar {
                return false
            }
        }
    
    return true
    
}

let word1 = "anna"

if palindrome(word: word1) {
    print("\(word1) is palindrome")
} else {
    print("\(word1) is not palindrome")
}


//4
func secondPower(_ numbers: [Int]) -> [Int] {
    var result: [Int] = []
        
    
    for number in numbers {
        let secondPow = number * number
        result.append(secondPow)
    }
    
    return result
}

let arrayExample = [4,5,6]

let powArray = secondPower(arrayExample)
print(powArray)


//5

func countWords(_ input: String) -> [String: Int] {
    var wordCounts: [String: Int] = [:]

    let words = input.lowercased().components(separatedBy: CharacterSet.whitespacesAndNewlines)

    for word in words {
        let cleanWord = word.trimmingCharacters(in: .punctuationCharacters)
        if !cleanWord.isEmpty {
            if let count = wordCounts[cleanWord] {
                wordCounts[cleanWord] = count + 1
            } else {
                wordCounts[cleanWord] = 1
            }
        }
    }

    return wordCounts
}

let stringExample = "both dogs and cats wanted to go to the park, but neither dog nor cat could go."
let wordCounts = countWords(stringExample)
for (word, count) in wordCounts {
    print("\(word): \(count)")
}


//6
let binary: (Int) -> String = { number in
    var result = ""
    var num = number
    
    while num > 0 {
        let remainder = num % 2
        result = String(remainder) + result
        num /= 2
    }
    
    if result.isEmpty {
        result = "0"
    }
    
    return result
}


let decimal = 15
let toBinary = binary(decimal)
print(toBinary)

//7
let filterOdds: ([Int]) -> [Int] = { numbers in
    return numbers.filter { $0 % 2 == 0 }
}

let arrayExample2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filteredArray = filterOdds(arrayExample2)
print(filteredArray)


//8
let multiply: ([Int]) -> [Int] = { numbers in
    return numbers.map { $0 * 10 }
}

let arrayExample3 = [4,5,6]
let multipliedArray = multiply(arrayExample3)
print(multipliedArray)


//9
func printSum(_ numbers: [Int], delaySec: TimeInterval, final: @escaping (Int) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + delaySec) {
        let sum = numbers.reduce(0, +)
        final(sum)
    }
}

let numbers9 = [1, 2, 3, 4, 5]

printSum(numbers9, delaySec: 3) { sum in
    print("The sum after 3 seconds is: \(sum)")
}

//10
func filterStrings(_ strings: [String]) -> [String] {
    let odd = strings.filter { $0.count % 2 != 0 }
    return odd
}


let array = ["snail", "bear", "lion", "giraffe", "pig"]
let odd = filterStrings(array)
print(odd)
