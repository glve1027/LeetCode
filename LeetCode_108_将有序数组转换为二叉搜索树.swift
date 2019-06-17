//
//  LeetCode_108.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/30.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let res = TreeNode(nums[nums.count / 2])
        res.left = sortedArrayToBST(Array(nums[0..<nums.count/2]))
        res.right = sortedArrayToBST(Array(nums[nums.count/2+1..<nums.count]))
        return res
    }
}
