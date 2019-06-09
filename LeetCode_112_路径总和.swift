//
//  LeetCode_112_路径总和.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/9.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        return helper(root, sum)
    }
    
    private func helper(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil && root.val == sum {
            return true
        }
        return helper(root.left, sum - root.val) || helper(root.right, sum - root.val)
    }
}
