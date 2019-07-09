//
//  LeetCode_566_重塑矩阵.swift
//  Coding
//
//  Created by GongHuan on 2019/7/9.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        guard !nums.isEmpty else { return [] }
        var total: [Int] = []
        for v in nums { total += v }
        if (r == 1 && c == total.count) { return [total] }
        // 异常处理
        if (nums.count <= r && total.count != r * c) { return nums }
        // Init datas
        var res: [[Int]] = Array(repeating: Array(repeating: Int.max, count: c), count: r)
        for i in 0..<res.count {
            var second = res[i]
            for j in 0..<second.count {
                second[j] = total.removeFirst()
            }
            res[i] = second
        }
        return res
    }
}
