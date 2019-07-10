//
//  LeetCode_485_最大连续1的个数.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        // init datas
        var result: Int = 0
        var count: Int = 0
        for i in 0..<nums.count {
            let value = nums[i]
            if (value == 1) {
                count += 1
            } else {
                result = max(count, result)
                count = 0
            }
        }
        return max(result, count)
    }
}
