//
//  LeetCode_872.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/26.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var res1: [Int] = []
    var res2: [Int] = []
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        findLeaf(root1, &res1)
        findLeaf(root2, &res2)
        return isSimilar()
    }
    
    private func findLeaf(_ root: TreeNode?, _ res: inout [Int]) {
        guard let root = root else { return }
        if root.left == nil && root.right == nil {
            res.append(root.val)
            return
        }
        findLeaf(root.left, &res)
        findLeaf(root.right, &res)
    }
    
    private func isSimilar() -> Bool {
        if res1.count != res2.count { return false }
        for i in 0..<res1.count {
            if (res1[i] != res2[i]) { return false }
        }
        return true
    }
}
