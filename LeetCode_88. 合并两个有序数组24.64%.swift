//
//  LeetCode_88. 合并两个有序数组24.64%.swift
//  tt
//
//  Created by GH on 2020/8/30.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard !nums2.isEmpty else { return }
        guard !nums1.isEmpty else {
            nums1 = nums2
            return
        }

        // copy num1
        var copyNums1: [Int] = []
        for i in 0..<m {
            copyNums1.append(nums1[i])
        }

        // properties
        // copyNums1
        var li = 0
        let le = m
        
        // nums2
        var ri = 0
        let re = n

        var index = 0

        // [li, le) , [ri, re) index ++
        while (li < le || ri < re) {
            if (li >= le) {
                nums1[index] = nums2[ri]
                ri += 1
                index += 1
            } else if (ri >= re) {
                nums1[index] = copyNums1[li]
                li += 1
                index += 1
            } else if (nums2[ri] < copyNums1[li]) {
                nums1[index] = nums2[ri]
                ri += 1
                index += 1
            } else {
                nums1[index] = copyNums1[li]
                li += 1
                index += 1
            }
        }
    }
}
