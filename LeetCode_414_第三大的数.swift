//
//  LeetCode_414_第三大的数.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let sortedNums = nums.sorted { $0 > $1 }
        var lastNum: Int = 0
        var count = 0
        for i in 0..<sortedNums.count {
            if (i == 0 || lastNum != sortedNums[i] ) {
                lastNum = sortedNums[i]
                count += 1
                if (count == 3) { return sortedNums[i] }
            }
        }
        return sortedNums.first!
    }
}
