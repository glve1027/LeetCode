//
//  LeetCode_101_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/15.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return helper(root.left, root.right)
    }
    
    private func helper(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if l != nil && r == nil {
            return false
        } else if l == nil && r != nil {
            return false
        } else if l == nil && r == nil {
            return true
        } else {
            return (l!.val == r!.val) && helper(l!.left, r!.right) && helper(l!.right, r!.left)
        }
    }
}
