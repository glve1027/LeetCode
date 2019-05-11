//
//  LeetCode_226.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/11.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        let res = TreeNode(root!.val)
        res.right = invertTree(root?.left)
        res.left = invertTree(root?.right)
        return res
    }
}
