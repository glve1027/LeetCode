//
//  LeetCode_938.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/7.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var res: [Int] = []
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        find(root)
        guard let lIndex = res.index(of: L), let rIndex = res.index(of: R) else { return -1 }
        return Array(res[lIndex...rIndex]).reduce(0, +)
    }
    
    // 中序遍历
    private func find(_ root: TreeNode?) {
        guard let root = root else { return }
        find(root.left)
        res.append(root.val)
        find(root.right)
    }
}

