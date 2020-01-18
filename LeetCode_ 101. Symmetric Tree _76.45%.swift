//
//  LeetCode_ 101. Symmetric Tree _76.45%.swift
//  Coding
//
//  Created by GH on 2020/1/18.
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        if root.left == nil && root.right == nil {
            return true
        } else if ((root.left == nil && root.right != nil) || (root.left != nil && root.right == nil)) {
            return false
        }
        
        return helper(root.left, root.right)
    }
    
    private func helper(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if (l == nil && r == nil) { return true }
        guard let l = l, let r = r, l.val == r.val else { return false }
        return helper(l.left, r.right) && helper(l.right, r.left)
    }
}
