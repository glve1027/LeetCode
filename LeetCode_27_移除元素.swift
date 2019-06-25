//
//  LeetCode_27_移除元素.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/25.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}
