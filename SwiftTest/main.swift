//
//  main.swift
//  SwiftTest
//
//  Created by SamXu on 29/6/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

var aQueue = Queue<Int>()
let n = Int(readLine()!)!
for i in 0..<n {
    let aline: String = readLine()!
    let components = aline.components(separatedBy: " ")
    if components[0] == "E" {
        aQueue.enqueue(Int(components[1])!)
        print(aQueue.count())
    } else {
        if let aInt = aQueue.dequeue() {
            print("\(aInt) \(aQueue.count())")
        } else {
            print ("-1 0")
        }
    }
}






