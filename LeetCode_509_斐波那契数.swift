//
//  LeetCode_509_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/23.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

// 普通解法 时间复杂度 2^n
class Solution {
    func fib(_ N: Int) -> Int {
        return N <= 1 ? N : fib(N-1) + fib(N-2)
    }
}

// 记忆话 memorize
class Solution {
    var memory: [Int: Int] = [:]
    func fib(_ N: Int) -> Int {
        if let temp = memory[N] { return temp }
        if N <= 1 {
            memory[N] = N
            return N
        }
        let res = fib(N-1) + fib(N-2)
        memory[N] = res
        return res
    }
}
