//
//  LeetCode_100. Same Tree_70.32%.swift
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if ((p == nil && q != nil) || (p != nil && q == nil)) {
            return false
        }
        return p!.val == q!.val && isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}
