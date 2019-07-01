//
//  LeetCode_283_移动零.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/2.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var NonZero: [Int] = []
        var Zero: [Int] = []
        _ = nums.map {
            if ($0 == 0) {
                Zero.append($0)
            } else {
                NonZero.append($0)
            }
        }
        nums = NonZero + Zero
    }
}
