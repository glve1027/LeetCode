//
//  LeetCode_349. Intersection of Two Arrays_11.04%.swift
//  Coding
//
//  Created by GongHuan on 2020/1/20.
//  Copyright © 2020 GongHuan. All rights reserved.
//

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let s1 = nums1.sorted { $0 < $1 }
        let s2 = nums2.sorted { $0 < $1 }
        
        var s1Index = 0
        var s2Index = 0
        
        var result: [Int] = []
        while s1Index <= s1.count - 1 && s2Index <= s2.count - 1 {
            let v1 = s1[s1Index]
            let v2 = s2[s2Index]
            
            if v1 > v2 {
                s2Index += 1
            } else if v1 < v2 {
                s1Index += 1
            } else {
                if result.isEmpty || !result.contains(v1) { result.append(v1) }
                s1Index += 1
                s2Index += 1
            }
        }
        
        return result
    }
}
