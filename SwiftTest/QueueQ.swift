//
//  QueueQ.swift
//  SwiftTest
//
//  Created by SamXu on 1/7/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

class School: CustomStringConvertible {
    var id = "0"
    var students = ["1"]
    var head = 0
    
    convenience init(id aId: String, roll aRoll: String) {
        self.init()
        id = aId
        students = [aRoll]
    }
    
    var description: String {
        return "id \(id) students \(students)"
    }
}

class QueueRunner {
    public func run() {
        
        var time = Date().timeIntervalSince1970
        
        var queue = [School]()
        
        let fileURL = URL(fileURLWithPath: "/Users/samxu/Desktop/Projects/SwiftTest/SwiftTest/2.txt")
        
        let string = try! String(contentsOf: fileURL)
        
        var stringCom = string.components(separatedBy: "\n")
        
        var n = Int(stringCom.removeFirst())!
        
        while n != 0 {
            
            let components = stringCom.removeFirst().components(separatedBy: " ")
            
            if components[0] == "E" {
                
                var foundSchool = false
                
                for school in queue {
                    if school.id == components[1] {
                        foundSchool = true
                        school.students.append(components[2])
                        break;
                    }
                }
                
                if foundSchool == false {
                    let school = School(id: components[1], roll: components[2]);
                    queue.append(school)
                }
                
            } else {
                let school = queue.first!
                let roll = school.students[school.head]
                print("\(school.id) \(roll)")
                school.head += 1
                if school.students.count == school.head {
                    queue.removeFirst()
                }
            }
            
            n -= 1
        }
        
        time -= Date().timeIntervalSince1970
        print(time)
    }
}
