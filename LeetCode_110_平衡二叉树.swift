//
//  LeetCode_110_.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/17.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let l = helper(root.left)
        let r = helper(root.right)
        return abs(l-r) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    // 入参：根节点
    // 以入参为根节点， 求高度
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil { return 1 }
        let l = helper(root.left)
        let r = helper(root.right)
        return max(l+1, r+1)
    }
}
