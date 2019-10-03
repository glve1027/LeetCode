//
//  LeetCode_1046_最后一块石头的重量_87.50%.swift
//  Coding
//
//  Created by Gonghuan on 2019/10/3.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        let sorted = stones.sorted { $0 < $1 }
        return handleStone(sorted)
    }
    
    private func handleStone(_ stones: [Int]) -> Int {
        guard !stones.isEmpty else { return 0 }
        if stones.count == 1 { return stones.first! }
        
        var stones = stones
        
        let x = stones.removeLast()
        let y = stones.removeLast()
        
        if (x != y) { insert2SortedData(abs(x-y), &stones, 0, stones.count - 1) }
        
        return handleStone(stones)
    }
    
    // 二分法
    private func insert2SortedData(_ value: Int, _ stones: inout [Int], _ l: Int, _ r: Int) {
        var r = r
        var l = l
        while l <= r {
            let mid = (r + l) / 2
            let midValue = stones[mid]
            if value > midValue {
                l = mid + 1
            } else if value < midValue {
                r = mid - 1
            } else {
                stones.insert(value, at: mid)
                return
            }
        }
        stones.insert(value, at: l)
    }
}
