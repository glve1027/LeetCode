//
//  LeetCode_35_搜索插入位置_17.75%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/18.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        return Helper(nums, 0, nums.count - 1, target)
    }
    
    // 二分搜索法
    private func Helper(_ nums: [Int], _ l: Int, _ r: Int, _ value: Int) -> Int {
        guard l < r else {
            let v = nums[l]
            if (v >= value) {
                return l
            }
            return l + 1
        }
        let mid = (l + r) / 2
        let findV = nums[mid]
        if (findV == value) {
            return mid
        } else if (findV > value) {
            return Helper(nums, l, mid - 1, value)
        } else {
            return Helper(nums, mid + 1, r, value)
        }
    }
}
