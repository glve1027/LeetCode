//
//  LeetCode_404.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/7.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var res: Int = 0
        if root.left != nil && root.left?.right == nil && root.left?.left == nil {
            res += root.left!.val
        }
        let l = sumOfLeftLeaves(root.left)
        let r = sumOfLeftLeaves(root.right)
        return res + l + r
    }
}
