//
//  LeetCode_66. 加一_91.91%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/15.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var temp: [Int] = []
        var willAdd: Int = 0
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            var value = willAdd + digits[i]
            if (i == digits.count - 1) { value += 1 }
            if (value >= 10) {
                willAdd = 1
                temp.insert(value - 10, at: 0)
            } else {
                willAdd = 0
                temp.insert(value, at: 0)
            }
        }
        if (willAdd > 0) { temp.insert(willAdd, at: 0) }
        return temp
    }
}
