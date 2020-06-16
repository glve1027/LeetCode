//
//  LeetCode_235. 二叉搜索树的最近公共祖先_93.83%.swift
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
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }

        if (root.val == p.val) { return p }
        if (root.val == q.val) { return q }
        if ((root.val - q.val) * (root.val - p.val) < 0) { return root }
        return p.val > root.val ? lowestCommonAncestor(root.right, p, q) : lowestCommonAncestor(root.left, p, q)
    }
}
