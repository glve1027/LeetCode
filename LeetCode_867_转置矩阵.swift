//
//  LeetCode_867_转置矩阵.swift
//  Coding
//
//  Created by GongHuan on 2019/7/8.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        guard !A.isEmpty else { return [] }
        var res: [[Int]] = []
        for i in 0..<A.count {
            let subDatas = A[i]
            for j in 0..<subDatas.count {
                if (i == 0) {
                    var temp: [Int] = []
                    temp.append(subDatas[j])
                    res.append(temp)
                } else {
                    var temp: [Int] = res[j]
                    temp.append(subDatas[j])
                    res[j] = temp
                }
            }
        }
        return res
    }
}
