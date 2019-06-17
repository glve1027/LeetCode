//
//  LeetCode_700.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/27.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == val {
            return root
        } else if (val > root.val) {
            return searchBST(root.right, val)
        } else {
            return searchBST(root.left, val)
        }
    }
}
