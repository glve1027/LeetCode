//
//  LeetCode_69_x 的平方根_78.30%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/11.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x >= 0 else { return -1 }
        return find(x, 0, x)
    }
    
    private func find(_ x: Int, _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        while l <= r {
            let mid = (l + r) / 2
            let dValue = mid * mid
            if (dValue == x) {
                return mid
            } else if (dValue < x) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r
    }
}
