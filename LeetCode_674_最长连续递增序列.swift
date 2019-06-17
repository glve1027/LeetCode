//
//  LeetCode_674.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/21.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var res: Int = -1
        var nextStartIndex = -1
        for i in 0..<nums.count {
            
            if nextStartIndex > 0 && i < nextStartIndex { continue }
            
            var startNumber = nums[i]
            var startIndex  = i
            var count = 1
            
            while startIndex <= nums.count - 1 {
                
                if startIndex + 1 <= nums.count - 1 && nums[startIndex + 1] > startNumber {
                    startNumber = nums[startIndex + 1]
                    count += 1
                } else {
                    if (startIndex + 1 <= nums.count - 1) { nextStartIndex = startIndex + 1 }
                    break
                }
                
                startIndex += 1
            }
            
            if (count > res) { res = count }
        }
        return res
    }
}
