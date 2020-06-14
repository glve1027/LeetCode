//
//  LeetCode_面试题 04.04. 检查平衡性_46.88%.swift
//  Coding
//
//  Created by GH on 2020/6/14.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return abs(rootHeight(root.left, 1) - rootHeight(root.right, 1)) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }

    private func rootHeight(_ root: TreeNode?, _ h: Int) -> Int {
        guard let root = root else { return h }
        if root.left == nil && root.right == nil { return h + 1 }
        return max(rootHeight(root.left, h + 1), rootHeight(root.right, h + 1))
    }
}
