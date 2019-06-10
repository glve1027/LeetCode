//
//  LeetCode_538.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/10.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        //guard let root = root else { return nil }
        var r = root
        dfs(&r)
        return r
    }
    
    var sum: Int = 0
    private func dfs(_ root: inout TreeNode?) {
        guard let root = root else { return }
        dfs(&root.right)
        root.val += sum
        sum = root.val
        dfs(&root.left)
    }
}
