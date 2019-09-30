//
//  LeetCode_762_二进制表示中质数个计算置位_66.67%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/30.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        guard L <= R else { return 0 }
        var result: Int = 0
        for i in L...R where isZhi(convert2binaryAndGetNumberOf(i)) {
            result += 1
        }
        return result
    }
    
    private func convert2binaryAndGetNumberOf(_ value: Int) -> Int  {
        guard value >= 0 else { return 0 }
        var value = value
        var result: Int = 0
        while value >= 2 {
            let number = value % 2
            if (number == 1) { result += 1 }
            value /= 2
        }
        if (value == 1) { result += 1 }
        return result
    }
    
    private func isZhi(_ value: Int) -> Bool {
        if (value <= 3) { return value > 1 }
        // 判断在不在6的旁边
        if (value % 6 != 1 && value % 6 != 5) { return false }
        let number = Int(sqrt(Double(value)))
        
        for i in stride(from: 5, through:number, by:6) {
            if (value % i == 0 || value % (i + 2) == 0) {
                return false
            }
        }
        return true
    }
}
