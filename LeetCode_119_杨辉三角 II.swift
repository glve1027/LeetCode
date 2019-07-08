//
//  LeetCode_119_杨辉三角 II.swift
//  Coding
//
//  Created by GongHuan on 2019/7/8.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var res = Array(repeating: Array(repeating: 0, count: rowIndex + 1), count: rowIndex + 1)
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
        guard let last = res.last else { return [] }
        return removeZero(last)
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
