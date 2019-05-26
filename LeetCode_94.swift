//
//  LeetCode_94.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/26.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var res: [Int] = []
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return res }
        inorderTraversal(root.left)
        res.append(root.val)
        inorderTraversal(root.right)
        return res
    }
}
