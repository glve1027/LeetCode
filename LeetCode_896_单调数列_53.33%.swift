//
//  LeetCode_896_单调数列_53.33%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/22.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        
        var increment: Bool = false
        var decrement: Bool = false
        var temp: [Int] = []
        for a in A {
            if !temp.isEmpty {
                if let last = temp.last, last == a {
                    continue
                } else if let last = temp.last, last > a {
                    decrement = true
                } else if let last = temp.last, last < a {
                    increment = true
                }
            }
            if increment && decrement { return false }
            temp.append(a)
        }
        
        return true
    }
}
