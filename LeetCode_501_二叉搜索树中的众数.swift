//
//  LeetCode_501.swift
//  TestCoding
//
//  Created by 龚欢 on 2019/5/26.
//  Copyright © 2019 龚欢. All rights reserved.
//

import Foundation

class Solution {
    var res: [Int: Int] = [:]
    func findMode(_ root: TreeNode?) -> [Int] {
        reFindMode(root)
        if res.isEmpty { return [] }
        var temp = res.sorted { $0.value > $1.value }
        if let maxValue = temp.first?.value {
            temp = temp.filter { (v) -> Bool in
                return v.value == maxValue
            }
        }
        var r: [Int] = []
        _ = temp.map { r.append($0.key) }
        return r
    }
    
    private func reFindMode(_ root: TreeNode?) {
        guard let root = root else { return }
        reFindMode(root.left)
        if var v = res[root.val] {
            v += 1
            res[root.val] = v
        } else {
            res[root.val] = 1
        }
        reFindMode(root.right)
    }
}
