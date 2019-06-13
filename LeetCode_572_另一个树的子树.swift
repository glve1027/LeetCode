//
//  LeetCode_572_另一个树的子树.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/13.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        } else if s == nil && t != nil {
            return false
        } else if s != nil && t == nil {
            return true
        }
        return helper(s, t) || isSubtree(s!.left, t) || isSubtree(s!.right, t)
    }
    
    private func helper(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        } else if s == nil && t != nil {
            return false
        } else if s != nil && t == nil {
            return false
        } else if s!.val != t!.val {
            return false
        } else {
            let l = helper(s!.left, t!.left)
            let r = helper(s!.right, t!.right)
            return s!.val == t!.val && l && r
        }
    }
}
