//
//  LeetCode_476_数字的补数_86.67%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/20.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func findComplement(_ num: Int) -> Int {
        guard num >= 0 else { return -1 }
        if num == 1 { return 0 }
        if num == 0 { return 1 }
        
        var num = num
        var result: [Int] = []
        while num >= 2 {
            let number = num % 2
            
            result.insert(convert21(number), at: 0)
            num /= 2
        }
        
        result.insert(convert21(num), at: 0)
        
        var calculateValue: Int = 0
        for i in 0..<result.count {
            let count = result.count - 1 - i
            calculateValue += Int(pow(Double(2), Double(count))) * result[i]
        }
        return calculateValue
    }
    
    private func convert21(_ from: Int) -> Int {
        return from == 0 ? 1 : 0
    }
}
