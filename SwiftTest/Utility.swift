//
//  Utility.swift
//  SwiftTest
//
//  Created by SamXu on 2/7/17.
//  Copyright © 2017 AnXu. All rights reserved.
//

import Foundation

public func LoadFile(name: String) -> String {
    let fileURL = URL(fileURLWithPath: "/Users/anxu/Projects/SwiftTest/SwiftTest/\(name)")
    return try! String(contentsOf: fileURL)
}

