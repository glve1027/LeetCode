//
//  LeetCode_215_数组中的第K个最大元素.swift
//  Coding
//
//  Created by GongHuan on 2019/7/10.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted { $0 > $1 }
        return sortedNums[k-1]
    }
}
