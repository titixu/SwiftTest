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
    var collection = [[Character : Int]]()
    let allCharaters = "zyxwvutsrqponmlkjihgfedcba"
    for s in allCharaters.characters {
        collection.append([s: 0])
    }
    print(collection)
}
