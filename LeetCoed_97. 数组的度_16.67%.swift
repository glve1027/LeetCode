//
//  LeetCoed_97. 数组的度_16.67%.swift
//  Coding
//
//  Created by GongHuan on 2019/7/16.
//  Copyright © 2019 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var collect: [Int: [Int]] = [:]
        for i in 0..<nums.count {
            let value = nums[i]
            if var indexs = collect[value] {
                indexs.append(i)
                collect[value] = indexs
            } else {
                collect[value] = [i]
            }
        }
        
        // sorted
        let sorted = collect.sorted { $0.value.count > $1.value.count }
        guard !sorted.isEmpty else { return 0 }
        let maxCount = sorted.first!.value.count
        
        // filter
        let filter = sorted.filter {
            $0.value.count == maxCount
        }
        
        var result: Int? = nil
        for (_, v) in filter {
            guard !v.isEmpty else { continue }
            guard let f = v.first, let l = v.last else { continue }
            if result != nil {
                result = min(result!, l - f + 1)
            } else {
                result = l - f + 1
            }
        }
        return result ?? 0
    }
}
