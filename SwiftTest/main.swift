//
//  main.swift
//  SwiftTest
//
//  Created by SamXu on 29/6/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    var list  = [T]()
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        if list.count > 0 {
            return list.remove(at: 0)
        }
        return nil
    }
    
    func front() -> T? {
        return list.first
    }
    
    func rear() -> T? {
        return list.last
    }
    
    func isEmpty() -> Bool {
        return (list.count != 0)
    }
}

var aQueue = Queue<Int>()
let n = Int(readLine()!)!
for i in 0..<n {
    let aline: String = readLine()!
    let components = aline.components(separatedBy: " ")
    if components[0] == "E" {
        aQueue.enqueue(Int(components[1])!)
        print(aQueue.list.count)
        
    } else {
        if let aInt = aQueue.dequeue() {
            print("\(aInt) \(aQueue.list.count)")
        } else {
            print ("-1 0")
        }
    }
}






