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

func PairSums() {
    
    var comp = readLine()!
    let firstPart = comp.components(separatedBy: " ")
    
    let expected = Int(firstPart.last!)!
    
    var sorted = [Int]()
    for _ in 0..<1000000 {
        sorted.append(0)
    }
    
    comp = readLine()!
    let secondPart = comp.components(separatedBy: " ")
    
    for aString in secondPart {
        let i = Int(aString)!
        sorted[i] = sorted[i] + 1
    }
    
    var head = 0
    var tail = sorted.count - 1
    
    while head != tail {
        
        let l = Int(sorted[head])
        if l == 0 {
            head += 1
            continue
        } else if l > 1 && (head + head) == expected {
            print("YES")
            return
        }
        
        let t = Int(sorted[tail])
        if t == 0 {
            tail -= 1
            continue
        } else if t > 1 && (tail + tail) == expected {
            print("YES")
            return
        }
        
        let sum = head + tail
        if  sum == expected {
            print("YES")
            return
        } else if sum < expected {
            head += 1
        } else {
            tail -= 1
        }
    }
    
    print("NO")
    
}

func MindPalaces() {
    var lines = LoadFile(name: "MindPalaces.txt").components(separatedBy: "\n")
    
    var collection = [String : String]()
    
    var line = lines.removeFirst().components(separatedBy: " ")
    let row = Int(line[0])!
    
    for r in 0..<row {
        line = lines.removeFirst().components(separatedBy: " ")
        for c in 0..<line.count {
            collection[line[c]] = "\(r) \(c)"
        }
    }
    
    let q = Int(lines.removeFirst())!
    
    for _ in 0..<q {
        let s = lines.removeFirst()
        if let string = collection[s] {
            print(string)
        } else {
            print("-1 -1")
        }
    }
    
}

func XsquareAndPalindromesInsertion() {
    
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        
        var s = readLine()!
        var collection = [Character: Int]()
        var result = 0
        
        for c in s.characters {
            collection[c] = (collection[c] ?? 0) + 1
        }
        
        for (_, value) in collection {
            if value % 2 != 0 {
                result += 1
            }
        }
        
        if result > 0 {
            result -= 1
        }
        
        print(result)
    }
    
}

func BobAndString() {
    
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        
        var tString = readLine()!
        var sString = readLine()!
        
        var result = 0
        
        var collection = [Character: Int]()
        for c in sString.characters {
            collection[c] = (collection[c] ?? 0) + 1
        }
        
        for c in tString.characters {
            if let value = collection[c]
            {
                if value > 0 {
                    collection[c] = value - 1
                } else {
                    result += 1
                }
            } else {
                result += 1
            }
        }
        
        for (_, value) in collection {
            if value > 0 {
                result += value
            }
        }
        print(result)
    }
}

func NeedleInTheHaystack() {
    //https://www.hackerearth.com/practice/data-structures/hash-tables/basics-of-hash-tables/practice-problems/algorithm/a-needle-in-the-haystack-1/
    
    var c = LoadFile(name: "hayStack.txt").components(separatedBy: "\n")
    
    let t = Int(c.removeFirst())!
    
    for _ in 0..<t {
        let patten = c.removeFirst()
        let text = c.removeFirst()
        var result = "NO"

        if text.contains(patten) || text.contains(String(patten.characters.reversed())) {
            result = "YES"
        }

        print(result)
    }
}



















