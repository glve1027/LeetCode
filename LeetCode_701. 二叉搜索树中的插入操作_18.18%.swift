//
//  LeetCode_701. 二叉搜索树中的插入操作_18.18%.swift
//  Coding
//
//  Created by GH on 2020/6/15.
//  Copyright © 2020 GH. All rights reserved.
//

import Foundation

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        guard root.val != val else { return nil }

        let result = root
        _ = find(root, val)
        return result
    }

    private func find(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val < val && root.right == nil {
            root.right = TreeNode(val)
            return root
        } else if root.val > val && root.left == nil {
            root.left = TreeNode(val)
            return root
        }

        if root.val > val {
            return insertIntoBST(root.left, val)
        } else {
            return insertIntoBST(root.right, val)
        }
    }
}
