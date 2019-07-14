//
//  LeetCode_217. 存在重复元素_63.83%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/14.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var temp: [Int: Int] = [:]
        for n in nums {
            if let _ = temp[n] {
                return true
            } else {
                temp[n] = 1
            }
        }
        return false
    }
}

// one line solution
// 5.67%
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Array(Set(nums)).count == nums.count ? false : true
    }
}
