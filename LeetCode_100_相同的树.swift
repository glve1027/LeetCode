//
//  LeetCode_100.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/4.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let p = p, let q = q, p.val == q.val else { return false }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
