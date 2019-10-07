//
//  LeetCode_704_二分查找_95.24%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/7.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.contains(target) else { return -1 }
        return find(nums, target, 0, nums.count - 1)
    }
    
    private func find(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        while l <= r {
            let mid = (l + r) / 2
            let currentValue = nums[mid]
            if (currentValue > target) {
                r = mid - 1
            } else if (currentValue < target) {
                l = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}
