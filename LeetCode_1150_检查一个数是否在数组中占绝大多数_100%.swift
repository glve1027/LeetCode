//
//  LeetCode_1150_检查一个数是否在数组中占绝大多数_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/28.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.contains(target) else { return false }
        var count: Int = 0
        _ = nums.map { if ($0 == target) { count += 1 } }
        return count > nums.count / 2
    }
}
