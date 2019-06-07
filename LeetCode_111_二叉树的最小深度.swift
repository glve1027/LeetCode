//
//  LeetCode_111_二叉树的最小深度.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/7.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil { return 1 }
        var value: Int = 0
        if root.left == nil && root.right != nil {
            value = minDepth(root.right)
        } else if root.left != nil && root.right == nil {
            value = minDepth(root.left)
        } else {
            let l = minDepth(root.left)
            let r = minDepth(root.right)
            value = min(l, r)
        }
        return value + 1
    }
}
