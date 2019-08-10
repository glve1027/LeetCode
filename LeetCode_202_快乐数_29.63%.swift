//
//  LeetCode_202_快乐数_29.63%.swift
//  Coding
//
//  Created by Gonghuan on 2019/8/10.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    var temp: [Int: Bool] = [:]
    func isHappy(_ n: Int) -> Bool {
        // 循环娄底
        if let _ = temp[n] { return false }
        
        let d = Array("\(n)")
        guard !d.isEmpty else { return false }
        
        var result: Int = 0
        for numberString in d  {
            if let number = Int(String(numberString)) {
                result += number * number
            }
        }
        
        if result == 1 { return true }
        
        temp[n] = true
        return isHappy(result)
    }
}
