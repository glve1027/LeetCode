//
//  LeetCode_118_杨辉三角.swift
//  Coding
//
//  Created by GongHuan on 2019/7/8.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

/*
 [
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
 ]
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        // init datas
        var res = Array(repeating: Array(repeating: 0, count: numRows), count: numRows)
        for i in 0..<res.count {
            var current = res[i]
            for j in 0...i {
                if (i == 0) {
                    current[0] = 1
                    res[i] = current
                } else {
                    var last = res[i-1]
                    if (j - 1 < 0) {
                        current[j] = last[j]
                    } else {
                        current[j] = last[j-1] + last[j]
                    }
                    res[i] = current
                }
            }
        }
        var final: [[Int]] = []
        _ = res.map {
            final.append(removeZero($0))
        }
        return final
    }
    
    private func removeZero(_ from: [Int]) -> [Int] {
        guard !from.isEmpty else { return [] }
        var temp: [Int] = []
        _ = from.map {
            if ($0 != 0) {
                temp.append($0)
            }
        }
        return temp
    }
}
