//
//  LeetCode_80_删除排序数组中的重复项 II_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/23.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var le: Int? = nil
        var re: Int? = nil
        var i: Int = 0
        while i <= nums.count - 1 {
            let current = nums[i]
            // set right element
            if (i+1 <= nums.count - 1) { re = nums[i+1] }
            
            // delete element
            if let l = le, let r = re, r == l, r == current {
                nums.remove(at: i)
                // !! not handle i
                if (i - 1 >= 0) { le = nums[i-1] }
                re = nil
            } else {
                // set left element
                le = current
                // reset right element
                re = nil
                //
                i += 1
            }
        }
        return nums.count
    }
}
