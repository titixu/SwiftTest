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
    var totalNumberAdded = 1
    var totalNumberRemoved = 0
    var students = 1
    var out = 0
    
    convenience init(id aId: String) {
        self.init()
        id = aId
    }
    
    var description: String {
        return "id \(id) totalNumberAdded \(totalNumberAdded) totalNumberRemoved \(totalNumberRemoved) students \(students) out \(out)"
    }
}

var queue = [School]()

var fileURL = URL(fileURLWithPath: "/Users/samxu/Desktop/Projects/SwiftTest/SwiftTest/2.txt")
var string = try String(contentsOf: fileURL)
var stringCom = string.components(separatedBy: "\n")

var n = Int(stringCom.removeFirst())!

while n != 0 {
    
    let components = stringCom.removeFirst().components(separatedBy: " ")
    
    if components[0] == "E" {
        
        var foundSchool = false
        
        for i in 0..<queue.count {
            
            var school = queue[i]
            if school.id == components[1] {
                school.students += 1
                school.totalNumberAdded += 1
                if school.students != Int(components[2])! {
                    print("!!!")
                }
                foundSchool = true
                break;
            }
        }
        
        if foundSchool == false {
            var school = School(id: components[1]);
            queue.append(school)
        }
        
    } else {
        var school = queue.first!
        school.out += 1
        print("\(school.id) \(school.out)")
        school.students -= 1
        school.totalNumberRemoved += 1
        if school.students == 0 {
            queue.remove(at: 0)
        }
    }
    
    n -= 1
}

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






