//
//  LeetCode_965.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/27.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if let l = root.left, l.val != root.val { return false }
        if let r = root.right, r.val != root.val { return false }
        return isUnivalTree(root.left) && isUnivalTree(root.right)
    }
}
