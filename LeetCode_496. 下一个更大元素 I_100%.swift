//
//  LeetCode_496. 下一个更大元素 I_100%.swift
//  Coding
//
//  Created by Gonghuan on 2019/9/2.
//  Copyright © 2019 Gonghuan. All rights reserved.
//

import Foundation

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let map2 = conver2Map(nums2)
        var result: [Int] = []
        for n in nums1 {
            guard let index = map2[n] else { continue }
            result.append(find(index, nums2))
        }
        return result
    }
    
    // convert array to map
    private func conver2Map(_ from: [Int]) -> [Int: Int] {
        var result: [Int: Int] = [:]
        for i in 0..<from.count {
            result[from[i]] = i
        }
        return result
    }
    
    // find greater value
    private func find(_ index: Int, _ from: [Int]) -> Int {
        if index == from.count - 1 { return -1 }
        let value = from[index]
        for i in index+1..<from.count where from[i] > value {
            return from[i]
        }
        return -1
    }
}
