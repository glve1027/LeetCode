//
//  LeetCode_303_区域和检索 - 数组不可变_23.33%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/14.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation


class NumArray {
    
    var nums: [Int] = []
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        guard i <= j, i >= 0 else { return 0 }
        guard !self.nums.isEmpty else { return 0 }
        guard self.nums.count > j else { return 0 }
        var result: Int = 0
        for k in i...j {
            result += self.nums[k]
        }
        return result
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */
