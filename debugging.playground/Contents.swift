//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: In this situation since words is an array of String Optionals and we are given that wordA and wordB can't be nil (because of !), so the proper way to unwrap the optional is to assert that it can't be nil.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
   static func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: The for loop should initialize i as a variable because i is being incremented. Similarly, numElements should be initialized using let since it remains constant throughout the function. The function should also return true instead of nil, because if the function passes through the for loop completely, than we know that the two words are palindromes. Also, when we have a bool as our return type, the return values are either true or false. I also changed the function to a static type so that the function calls can be made without creating an instance.
    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    static func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters = [Character : Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_,count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: The dictionary was initialized incorrectly, I corrected the code above to use the proper syntax. Other than that, I fixed the for loop, I changed lenA and lenB to be constants instead of variables and changed the final return to true. I also made the function to a static type so that the function calls can be made without creating an instance.


//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

