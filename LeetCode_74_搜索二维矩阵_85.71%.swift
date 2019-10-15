//
//  LeetCode_74_搜索二维矩阵_85.71%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/15.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        for arr in matrix {
            if let first = arr.first, first <= target, let last = arr.last, last >= target {
                return find(arr, target, 0, arr.count - 1)
            }
        }
        return false
    }
    
    private func find(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> Bool {
        var l = l
        var r = r
        while l <= r {
            let mid = (l + r) / 2
            let value = nums[mid]
            if (value == target) {
                return true
            } else if (value > target) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}
