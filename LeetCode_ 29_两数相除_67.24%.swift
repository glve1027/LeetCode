//
//  LeetCode_ 29_两数相除_67.24%.swift
//  Coding
//
//  Created by GongHuan on 2019/10/14.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if (dividend == 0) { return 0 }
        if (divisor == 1) { return dividend }
        let v = dividend * divisor > 0 ? 1 : -1
        if (abs(dividend) == abs(divisor)) { return v }
        return find(abs(dividend), abs(divisor), 0, abs(dividend) - 1) * v
    }
    
    private func find(_ dividend: Int, _ divisor: Int, _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        while l <= r {
            let mid = (l+r)/2
            let current = mid * divisor
            if (current == dividend) {
                return mid
            } else if (current > dividend) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return r
    }
}
