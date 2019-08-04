//
//  LeetCode_350_两个数组的交集 II_95.74%.swift
//  WW
//
//  Created by 龚欢 on 2019/8/4.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if (nums1.isEmpty || nums2.isEmpty) { return [] }
        var m2 = conver2Map(nums2)
        var m1 = conver2Map(nums1)
        var result: [Int] = []
        if (nums1.count <= nums2.count) {
            calculate(nums1, &m2) { result.append($0) }
        } else {
            calculate(nums2, &m1) { result.append($0) }
        }
        return result
    }
    
    private func calculate(_ nums: [Int], _ m: inout [Int: Int], _ completion: (Int) -> ()) {
        for k in nums {
            if var count = m[k] {
                completion(k)
                count -= 1
                if (count == 0) {
                    m.removeValue(forKey:k)
                } else {
                    m[k] = count
                }
            }
        }
    }
    
    private func conver2Map(_ nums: [Int]) -> [Int: Int] {
        var result: [Int: Int] = [:]
        for n in nums {
            if var count = result[n] {
                count += 1
                result[n] = count
            } else {
                result[n] = 1
            }
        }
        return result
    }
}
