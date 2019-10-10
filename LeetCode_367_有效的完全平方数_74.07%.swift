//
//  LeetCode_367_有效的完全平方数_74.07%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        return find(num, 0, num)
    }
    
    private func find(_ num: Int, _ l: Int, _ r: Int) -> Bool {
        var l = l
        var r = r
        while l <= r {
            let mid = (l + r) / 2
            let dValue = mid * mid
            if (dValue == num) {
                return true
            } else if (dValue > num) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}
