//
//  LeetCode_26_删除排序数组中的重复项.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/25.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let setNums = Set(nums)
        nums = Array(setNums).sorted{ $0 < $1 }
        return nums.count
    }
}
