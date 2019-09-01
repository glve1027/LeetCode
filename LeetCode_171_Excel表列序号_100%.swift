//
//  LeetCode_171_Excel表列序号_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/1.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func titleToNumber(_ s: String) -> Int {
        let datas: [String: Int] = ["A": 1, "B": 2, "C": 3, "D": 4,"E": 5, "F":6, "G":7, "H": 8, "I":9, "J":10, "K":11, "L":12, "M":13, "N":14, "O":15, "P":16, "Q":17, "R":18, "S":19, "T":20, "U":21, "V":22, "W":23, "X":24, "Y":25, "Z": 26]
        let sDatas = Array(s)
        var result: Int = 0
        for i in 0..<sDatas.count {
            guard let number = datas[String(sDatas[i])] else { continue }
            result += calculate(sDatas.count - 1 - i) * number
        }
        return result
    }
    
    private func calculate(_ count: Int) -> Int {
        var result: Int = 1
        guard count > 0 else { return result }
        for _ in 1...count {
            result *= 26
        }
        return result
    }
}
