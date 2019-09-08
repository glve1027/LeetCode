//
//  LeetCode_693_交替位二进制数_25%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/8.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        if n == 0 || n == 1 { return true }
        
        var n = n
        var collect: [Int] = []
        while n >= 2 {
            let number = n % 2
            // 栈的数据结构
            if let last = collect.last, last == number { return false }
            
            collect.append(number)
            n /= 2
        }
        
        if let last = collect.last, last == n { return false }
        return true
    }
}
