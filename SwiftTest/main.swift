//
//  main.swift
//  SwiftTest
//
//  Created by SamXu on 29/6/17.
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

var time = Date().timeIntervalSince1970

var queue = [School]()

var fileURL = URL(fileURLWithPath: "/Users/samxu/Desktop/Projects/SwiftTest/SwiftTest/2.txt")
var string = try String(contentsOf: fileURL)
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
            var school = School(id: components[1], roll: components[2]);
            queue.append(school)
        }
        
    } else {
        var school = queue.first!
        var roll = school.students[school.head]
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

//struct Student {
//    var school = "0";
//    var rollNumber = "0";
//}
//
//var aQueue = [Student]()
//let n = Int(readLine()!)!
//var aStudent = Student()
//
//for _ in 0..<n {
//    let components = readLine()!.components(separatedBy: " ")
//    let count = aQueue.count
//    
//    if components[0] == "E" {
//        aStudent = Student(school: components[1], rollNumber: components[2])
//        if count < 2 {
//            aQueue.append(aStudent)
//        } else {
//            for (index, theStudent) in aQueue.enumerated().reversed() {
//                if theStudent.school == aStudent.school {
//                    aQueue.insert(aStudent, at: index + 1)
//                    break;
//                }
//            }
//            if aQueue.count == count {
//                aQueue.append(aStudent)
//            }
//        }
//    } else {
//        aStudent = aQueue.remove(at: 0)
//        print("\(aStudent.school) \(aStudent.rollNumber)")
//    }
//}


//for i in 0..<n {
//    let aline: String = readLine()!
//    let components = aline.components(separatedBy: " ")
//    if components[0] == "E" {
//        aQueue.enqueue(Int(components[1])!)
//        print(aQueue.count())
//    } else {
//        if let aInt = aQueue.dequeue() {
//            print("\(aInt) \(aQueue.count())")
//        } else {
//            print ("-1 0")
//        }
//    }
//}






