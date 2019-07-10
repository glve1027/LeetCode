//
//  LeetCode_136_只出现一次的数字.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var temp: [Int: Int] = [:]
        for n in nums {
            if var count = temp[n] {
                count += 1
                temp[n] = count
                if (count == 2) { temp.removeValue(forKey: n) }
            } else {
                temp[n] = 1
            }
        }
        guard temp.count == 1 else { return 0 }
        return temp.first!.key
    }
}
