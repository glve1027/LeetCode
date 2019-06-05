//
//  LeetCode_1.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/5.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var indexData: [Int: Int] = [:]
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            indexData[nums[i]] = i
        }
        
        for i in 0..<nums.count {
            if let k = indexData[target-nums[i]], k != i {
                return [i, k]
            }
        }
        return []
    }
}
