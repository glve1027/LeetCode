//
//  LeetCode_1064_不动点_100%.swift
//  Coding
//
//  Created by GongHuan on 2019/9/6.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func fixedPoint(_ A: [Int]) -> Int {
        guard !A.isEmpty else { return -1 }
        for i in 0..<A.count where A[i] == i { return i }
        return -1
    }
}
