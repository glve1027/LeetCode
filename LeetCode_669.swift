//
//  LeetCode_669.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/28.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val >= L && root.val <= R {
            let res = TreeNode(root.val)
            res.left = trimBST(root.left, L, R)
            res.right = trimBST(root.right, L, R)
            return res
        } else if root.val < L {
            return trimBST(root.right, L, R)
        } else {
            return trimBST(root.left, L, R)
        }
    }
}
