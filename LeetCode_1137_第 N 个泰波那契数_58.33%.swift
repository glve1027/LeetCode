//
//  LeetCode_1137_第 N 个泰波那契数_58.33%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/4.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if (n == 0) { return 0 }
        if (n == 1 || n == 2) { return 1 }
        var datas: [Int] = [0, 1, 1]
        for i in 3...n {
            let current = datas[i-3] + datas[i-2] + datas[i-1]
            datas.append(current)
        }
        return datas.last!
    }
}

