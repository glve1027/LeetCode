//
//  LeetCode_268_缺失数字.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted{ $0 < $1 }
        var last: Int = -1
        for i in 0..<sortedNums.count {
            if (sortedNums[i] != last + 1) { return last + 1 }
            last = sortedNums[i]
        }
        return last + 1
    }
}
