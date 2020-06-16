//
//  LeetCode_230. 二叉搜索树中第K小的元素_84.81%.swift
//  Coding
//
//  Created by GH on 2020/6/16.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var result: [Int] = []
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        convert2Array(root)
        guard !result.isEmpty else { return -1 }
        return result[k-1]
    }

    private func convert2Array(_ root: TreeNode?) {
        guard let root = root else { return }
        convert2Array(root.left)
        result.append(root.val)
        convert2Array(root.right)
    }
}
