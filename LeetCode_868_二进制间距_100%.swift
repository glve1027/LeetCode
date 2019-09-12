//
//  LeetCode_868_二进制间距_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/12.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func binaryGap(_ N: Int) -> Int {
        guard N > 0 else { return 0 }
        if (N == 0 || N == 1) { return 0 }
        var N = N
        // 返回二进制
        var result: [Int] = []
        while N >= 2 {
            let number = N % 2
            result.insert(number, at: 0)
            N /= 2
        }
        if (N != 0) { result.insert(N, at: 0) }
        // 计算二进制之间的最大距离
        var last: Int? = nil
        var space: Int = 0
        for i in 0..<result.count where result[i] == 1 {
            if (last != nil) {  space = max(space, i - last!) }
            last = i
        }
        
        return space
    }
}
