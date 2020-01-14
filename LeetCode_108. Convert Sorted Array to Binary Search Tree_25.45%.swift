//
//  LeetCode_108. Convert Sorted Array to Binary Search Tree_25.45%.swift
//  Coding
//
//  Created by GH on 2020/1/14.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        
        let midIndex = nums.count / 2
        let result = TreeNode(nums[midIndex])
        
        result.left = sortedArrayToBST(Array(nums[0..<midIndex]))
        result.right = sortedArrayToBST(Array(nums[midIndex+1..<nums.count]))
        
        return result
    }
}
