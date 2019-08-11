//
//  Search.swift
//  SwiftTest
//
//  Created by An Xu on 11/8/19.
//  Copyright © 2019 AnXu. All rights reserved.
//

import Foundation

func function(x: Int) -> Int {
    return (2 * Int(pow(Double(x), 2))) - (12 * x) + 7
}

func findingMino() {
    // https://www.hackerearth.com/practice/algorithms/searching/ternary-search/tutorial/
    
    // input text file, it is inside the project
    var c = LoadFile(name: "findingMino.text").components(separatedBy: "\n")
    
    let n = Int(c.removeFirst())!
    
    let time = Date()
    for _ in 0..<n {
        let componts = c.removeFirst().components(separatedBy: " ")
        let l = Int(componts.first!)!
        let r = Int(componts.last!)!
        var result: Int?
        for i in l...r {
            let calculated = function(x: i)
            if result == nil {
                result = calculated
                continue
            }
            if calculated < result! {
                result = calculated
            }
        }
        print("\(result!)")
    }
    print("time \(Date().timeIntervalSince(time))")
}
