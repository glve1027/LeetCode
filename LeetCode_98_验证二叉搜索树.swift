//
//  LeetCode_98.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/26.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return reValidBST(root, nil, nil)
    }
    
    func reValidBST(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root = root else { return true }
        if let min = min {
            if root.val <= min { return false }
        }
        
        if let max = max {
            if root.val >= max { return false }
        }
        return reValidBST(root.left, min, root.val) && reValidBST(root.right, root.val, max)
    }
}
