//
//  LeetCode_287_寻找重复数_29.17%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/20.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let sorted = nums.sorted { $0 < $1 }
        guard !sorted.isEmpty else { return -1 }
        guard let first = sorted.first else { return -1 }
        var f = first
        for i in 1..<sorted.count {
            let current = sorted[i]
            if (i != 0 && current == f) { return current }
            
            f = sorted[i]
        }
        return -1
    }
}
