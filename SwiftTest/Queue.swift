//
//  Queue.swift
//  SwiftTest
//
//  Created by SamXu on 30/6/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    private var list  = [T]()
    
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
    
    func count() -> Int {
        return list.count
    }
}
