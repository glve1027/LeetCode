//
//  LeetCode_766_托普利茨矩阵_7.14%.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/7/17.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        /*
         0-0, 1-1, 2-2
         0-1, 1-2, 2-3
         0-2, 1-3
         0-3
         
         1-0, 2-1
         ...
         */
        guard !matrix.isEmpty else { return true }
        var last: [Int] = []
        for m in matrix {
            if !last.isEmpty {
                let lastExceptLast = Array(last[0..<m.count - 1])
                let exceptOne = Array(m[1..<m.count])
                if (lastExceptLast != exceptOne) { return false }
            }
            last = m
        }
        return true
    }
}
