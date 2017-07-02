//
//  HashTable.swift
//  SwiftTest
//
//  Created by SamXu on 1/7/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

class HashTable {
    
    public func run () {
        var n = Int(readLine()!)!
        
        var roster = [String]()
        
        while n > 0 {
           var component = readLine()!.components(separatedBy: " ")
            let name = component[1]
            roster.append(name)
            n -= 1
        }
        
        var numberOfQueies = Int(readLine()!)!
        
        while numberOfQueies > 0 {
            let roll = Int(readLine()!)!
            print(roster[roll - 1])
            numberOfQueies -= 1
        }
    }
    
    public func fileRun() {
        
    }
}

class XsquareAndDouble {
    
    static func run() {
        
        var testCases = Int(readLine()!)!
        while testCases > 0 {
            
            var aString = readLine()!
            let characters = aString.characters
            
            var s = Set<Character>()
            var found = false
            
            for c in characters {
                
                let (inserted, _) = s.insert(c)

                if inserted == false {
                    print("Yes")
                    found = true
                    break
                }
            }
            
            if !found {
                print("No")
            }
            
            testCases -= 1
        }
    }
}

func MaxOccurrence() {
    
    let aString = readLine()!
    var collection = [UnicodeScalar: Int]()
    var maxValue = 0
    var result = "A"
    
    for c in aString.characters {
        let s = String(c)
        let k = s.unicodeScalars.min()!
        collection[k] = ((collection[k]) ?? 0) + 1
        if collection[k]! > maxValue {
            maxValue = collection[k]!
            result = s
        } else if collection[k]! == maxValue && k < result.unicodeScalars.min()! {
            result = s
        }
    }
    
    print("\(result) \(String(maxValue))")
}


func DifficultCharaters() {
    
    let fileURL = URL(fileURLWithPath: "/Users/samxu/Desktop/Projects/SwiftTest/SwiftTest/DifficultCharaters.txt")
    let string = try! String(contentsOf: fileURL)
    var stringCom = string.components(separatedBy: "\r\n")

    class Node {
        var charater: Character
        var value: Int
        
        init(c: Character, v: Int) {
            charater = c
            value = v
        }
        
        func code() -> UnicodeScalar {
            return String(charater).unicodeScalars.min()!
        }
        
    }
    
    var dictionary = [Character: Int]()
    
    let allCharaters = "zyxwvutsrqponmlkjihgfedcba"
    for c in allCharaters.characters {
        dictionary[c] = 0
    }
    
    let n = stringCom.removeFirst()
    var testsCases = Int(n)!
    
    while testsCases > 0 {
        
        var cases = stringCom.removeFirst()
        for s in cases.characters {
            dictionary[s] = dictionary[s]! + 1
        }
        
        var collection = [Node]()
        
        for (key, value) in dictionary {
            let node = Node(c: key, v: value)
            collection.append(node)
        }
        
        collection = collection.sorted(by: { (left, right) -> Bool in
            if left.value == right.value {
                return (left.code() > right.code())
            }
            return left.value < right.value
        })
        
        var stringToPrint = ""
        for node in collection {
            stringToPrint.append(node.charater)
            stringToPrint.append(" ")
        }
        print(stringToPrint)
        
        testsCases -= 1
    }
}

