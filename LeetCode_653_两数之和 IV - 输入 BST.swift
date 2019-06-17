//
//  LeetCode_653.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/6/5.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        reFindTarget(root)
        // 数据至少为2个，否则为false
        guard res.count > 1 else { return false }
        // 数据个数大于1个时
        var i = 0
        var j = res.count - 1
        while i < j {
            let v = res[i] + res[j]
            if (v == k) {
                return true
            } else if (v > k) {
                j -= 1
            } else {
                i += 1
            }
        }
        return false
    }
    
    var res: [Int] = []
    private func reFindTarget(_ root: TreeNode?) {
        guard let root = root else { return }
        reFindTarget(root.left)
        res.append(root.val)
        reFindTarget(root.right)
    }
}
