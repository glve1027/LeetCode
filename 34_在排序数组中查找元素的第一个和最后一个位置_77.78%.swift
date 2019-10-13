//
//  34_在排序数组中查找元素的第一个和最后一个位置_77.78%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/13.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return find(nums, target, 0, nums.count - 1)
    }
    
    private func find(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> [Int] {
        var l = l
        var r = r
        while l <= r {
            let mid = (l+r)/2
            let value = nums[mid]
            if (value == target) {
                print(mid)
                var before = mid
                while (before - 1 >= 0 && before - 1 <= nums.count - 1 && nums[before - 1] == value) {
                    before -= 1
                }
                
                var last = mid
                while last + 1 >= 0 && last + 1 <= nums.count - 1 && nums[last + 1] == value {
                    last += 1
                }
                return [before, last]
            } else if (value > target) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return [-1, -1]
    }
}
