//
//  LeetCode_1009_十进制整数的反码_27.27%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/16.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        guard N >= 0 else { return 0 }
        if N == 0 { return 1 }
        if N == 1 { return 0 }
        var N = N
        var result: [Int] = []
        while N >= 2 {
            let number = N % 2
            result.insert(handler(number), at:0)
            N /= 2
        }
        
        if (N != 0) { result.insert(handler(N), at:0) }
        return calculate(result)
    }
    
    // 将二进制转化为10进制
    private func calculate(_ numbers: [Int]) -> Int {
        var result: Int = 0
        for i in 0..<numbers.count {
            result += numbers[i] * Int(pow(Double(2), Double(numbers.count - 1 - i)))
        }
        return result
    }
    
    // 翻转二进制
    private func handler(_ number: Int) -> Int {
        return number == 1 ? 0 : 1
    }
}
